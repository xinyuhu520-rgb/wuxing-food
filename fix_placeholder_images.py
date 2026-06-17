#!/usr/bin/env python3
"""
修复 food-images.json - 为每个菜品生成带名称的占位图
"""

import json
import os

def get_wuxing_color(wuxing):
    """根据五行返回颜色"""
    colors = {
        '金': 'C0C0C0',  # 银色
        '木': '4CAF50',  # 绿色
        '水': '2196F3',  # 蓝色
        '火': 'F44336',  # 红色
        '土': 'FF9800',  # 橙色
    }
    return colors.get(wuxing, '888888')

# 读取 food-images.json
with open('food-images.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

print(f"找到 {len(data['foods'])} 个菜品")

# 为每个菜品生成带名称的占位图URL
for i, food in enumerate(data['foods']):
    name = food['name']
    wuxing = food.get('wuxing', '土')
    color = get_wuxing_color(wuxing)

    # 使用via.placeholder.com生成带名称的占位图
    # 格式：https://via.placeholder.com/400x300/COLOR/FFFFFF?text=NAME
    placeholder_url = f"https://via.placeholder.com/400x300/{color}/FFFFFF?text={name}"

    food['image'] = placeholder_url
    print(f"  {name} → {placeholder_url[:50]}...")

# 保存更新后的JSON
with open('food-images.json', 'w', encoding='utf-8') as f:
    json.dump(data, f, ensure_ascii=False, indent=2)

print(f"\n✅ food-images.json 更新完成")
print(f"所有 {len(data['foods'])} 个菜品都使用带名称的占位图")
print("每个菜品显示对应的名称，不会再出现图片与菜品不符的问题")
