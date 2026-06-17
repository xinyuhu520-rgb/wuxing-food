#!/bin/bash

# 更新 food-images.json 使用本地图片

echo "更新 food-images.json 使用本地图片..."

# 获取所有有效的本地图片文件
valid_files=$(ls -1 images/food/ | grep -E '\.jpg$' | while read f; do
  size=$(stat -f%z "images/food/$f" 2>/dev/null || stat -c%s "images/food/$f" 2>/dev/null)
  if [ "$size" -gt 1024 ]; then
    echo "$f"
  fi
done)

# 创建临时的Python脚本来更新JSON
cat > /tmp/update_json.py << 'PYTHON_SCRIPT'
import json
import os
import re

# 读取 food-images.json
with open('food-images.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

# 获取所有有效的本地图片
valid_files = []
for filename in os.listdir('images/food'):
    if filename.endswith('.jpg'):
        filepath = os.path.join('images/food', filename)
        size = os.path.getsize(filepath)
        if size > 1024:  # 大于1KB
            valid_files.append(filename)

valid_files.sort()

print(f"找到 {len(valid_files)} 个有效图片")

# 更新每个菜品的图片路径
updated = 0
for i, food in enumerate(data['foods']):
    if i < len(valid_files):
        # 使用本地图片
        local_path = f"images/food/{valid_files[i]}"
        food['image'] = local_path
        updated += 1

print(f"更新了 {updated} 个菜品的图片路径")

# 保存更新后的JSON
with open('food-images.json', 'w', encoding='utf-8') as f:
    json.dump(data, f, ensure_ascii=False, indent=2)

print("✅ food-images.json 更新完成")
PYTHON_SCRIPT

# 运行Python脚本
python3 /tmp/update_json.py

# 清理
rm -f /tmp/update_json.py
