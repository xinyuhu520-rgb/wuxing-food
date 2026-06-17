#!/bin/bash

# 修复所有图片URL - 使用本地图片

echo "修复 food-images.json 使用本地图片..."

# 获取所有有效的本地图片（大于1KB）
valid_files=$(ls -1 images/food/ | grep -E '\.jpg$' | while read f; do
  size=$(stat -f%z "images/food/$f" 2>/dev/null || stat -c%s "images/food/$f" 2>/dev/null)
  if [ "$size" -gt 1024 ]; then
    echo "$f"
  fi
done | sort)

# 创建Python脚本来更新JSON
cat > /tmp/fix_images.py << 'PYTHON_SCRIPT'
import json
import os

# 读取 food-images.json
with open('food-images.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

# 获取所有有效的本地图片
valid_files = []
for filename in sorted(os.listdir('images/food')):
    if filename.endswith('.jpg'):
        filepath = os.path.join('images/food', filename)
        size = os.path.getsize(filepath)
        if size > 1024:  # 大于1KB
            valid_files.append(filename)

print(f"找到 {len(valid_files)} 个有效本地图片")

# 为每个菜品分配一个唯一的本地图片
for i, food in enumerate(data['foods']):
    if i < len(valid_files):
        # 使用本地图片
        local_path = f"images/food/{valid_files[i]}"
        food['image'] = local_path
        print(f"  {food['name']} → {local_path}")
    else:
        # 如果没有足够的本地图片，使用占位图
        food['image'] = f"https://via.placeholder.com/400x300/d4a853/ffffff?text={food['name']}"
        print(f"  {food['name']} → 占位图")

# 保存更新后的JSON
with open('food-images.json', 'w', encoding='utf-8') as f:
    json.dump(data, f, ensure_ascii=False, indent=2)

print("\n✅ food-images.json 更新完成")
PYTHON_SCRIPT

# 运行Python脚本
python3 /tmp/fix_images.py

# 清理
rm -f /tmp/fix_images.py
