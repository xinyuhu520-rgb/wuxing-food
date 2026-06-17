#!/bin/bash

# 图片下载和压缩脚本
# 用于下载 food-images.json 中的所有图片并压缩

set -e

# 创建图片目录
mkdir -p images/food

echo "开始下载和压缩图片..."

# 提取所有图片URL
grep -o '"image": "[^"]*"' food-images.json | sed 's/"image": "//;s/"$//' > /tmp/image_urls.txt

total=$(wc -l < /tmp/image_urls.txt)
count=0

# 下载并压缩每张图片
while IFS= read -r url; do
  count=$((count + 1))

  # 生成文件名（使用序号）
  filename="food_$(printf "%03d" $count).jpg"
  filepath="images/food/$filename"

  # 下载图片
  echo "[$count/$total] 下载: $filename"
  curl -s -L "$url" -o "/tmp/temp_$filename" || {
    echo "  ✗ 下载失败，跳过"
    continue
  }

  # 检查文件是否存在且不为空
  if [ ! -s "/tmp/temp_$filename" ]; then
    echo "  ✗ 文件为空，跳过"
    continue
  fi

  # 压缩图片（质量80%，最大宽度800px）
  convert "/tmp/temp_$filename" -resize '800x800>' -quality 80 -strip "$filepath" 2>/dev/null || {
    echo "  ✗ 压缩失败，使用原图"
    cp "/tmp/temp_$filename" "$filepath"
  }

  # 删除临时文件
  rm -f "/tmp/temp_$filename"

  # 显示文件大小
  size=$(ls -lh "$filepath" 2>/dev/null | awk '{print $5}')
  echo "  ✓ 压缩完成: $size"

done < /tmp/image_urls.txt

echo ""
echo "✅ 所有图片下载和压缩完成！"
echo "总计: $count 张图片"
echo "存储位置: images/food/"

# 清理临时文件
rm -f /tmp/image_urls.txt
