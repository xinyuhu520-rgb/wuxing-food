# 五行食谱 - 社交分享优化

## 📸 分享预览图

### 如何生成预览图

由于 GitHub Pages 不支持动态生成图片，你需要手动生成分享预览图：

#### 方法1：浏览器截图（推荐）

1. 打开 `share-preview.html` 文件
2. 在浏览器中打开开发者工具（F12）
3. 切换到"设备模拟器"模式（Ctrl+Shift+M 或 Cmd+Shift+M）
4. 设置尺寸为 1200x630（社交分享标准尺寸）
5. 截图并保存为 `share-preview.png`
6. 上传到项目根目录

#### 方法2：使用在线工具

1. 访问 https://www.browserstack.com/ 或 https://www.screenshotmachine.com/
2. 输入 `share-preview.html` 的 URL
3. 设置尺寸为 1200x630
4. 下载截图并保存为 `share-preview.png`

#### 方法3：使用截图工具

```bash
# 使用 Chrome 无头模式截图
chrome --headless --screenshot=share-preview.png --window-size=1200,630 share-preview.html

# 或者使用 Firefox
firefox --headless --screenshot=share-preview.png --window-size=1200,630 share-preview.html
```

---

## 🎨 预览图设计

**尺寸：** 1200x630 像素（社交分享标准尺寸）

**元素：**
- ☯ 八卦图标（金色）
- 🔮 今日食运（标题）
- 五行八卦 · 测算今日宜忌（副标题）
- 4个特色卡片：150+菜品、幸运色、吉利方向、幸运数字
- 底部提示文字

**配色：**
- 背景：浅蓝紫渐变（#dce9ff → #e8d5f5 → #f0e6ff）
- 标题：金色（#d4a853）
- 文字：深灰色（#444）
- 卡片：白色半透明

---

## 📱 社交分享配置

### Open Graph 标签

```html
<meta property="og:title" content="🔮 今天吃什么？输入生日秒算！五行八卦解锁你的专属食运密码">
<meta property="og:description" content="✨ 150+道菜品智能推荐 | 🎨 解锁幸运色、吉利方向、最佳时间 | 🔢 幸运数字关联推荐 | 🧭 交友社交指南 | 让你今天吃对食物，旺运加分！">
<meta property="og:image" content="https://xinyuhu520-rgb.github.io/wuxing-food/share-preview.png">
```

### 标题优化

**当前标题：**
```
🔮 今天吃什么？输入生日秒算！五行八卦解锁你的专属食运密码
```

**特点：**
- ✅ 使用 emoji 吸引注意
- ✅ 提问式标题，引发好奇
- ✅ 突出核心功能（输入生日秒算）
- ✅ 强调个性化（专属食运密码）
- ✅ 包含关键词（五行八卦）

### 描述优化

**当前描述：**
```
✨ 150+道菜品智能推荐 | 🎨 解锁幸运色、吉利方向、最佳时间 | 🔢 幸运数字关联推荐 | 🧭 交友社交指南 | 让你今天吃对食物，旺运加分！
```

**特点：**
- ✅ 使用竖线分隔，清晰易读
- ✅ 每个功能用 emoji 标注
- ✅ 突出核心卖点
- ✅ 强调用户收益（旺运加分）
- ✅ 控制在 200 字以内

---

## ✅ 验证分享效果

### 测试工具

1. **Facebook Sharing Debugger**
   - https://developers.facebook.com/tools/debug/
   - 输入网址，查看预览效果

2. **Twitter Card Validator**
   - https://cards-dev.twitter.com/validator
   - 输入网址，验证卡片效果

3. **LinkedIn Post Inspector**
   - https://www.linkedin.com/post-inspector/
   - 输入网址，检查分享预览

### 微信分享测试

1. 在微信中打开网页
2. 点击右上角"..."
3. 选择"发送给朋友"
4. 查看分享卡片是否显示标题和预览图

---

## 📊 分享效果对比

### 优化前

```
标题：今日食运 · 五行八卦测算
描述：（无）
预览图：（无）
```

### 优化后

```
标题：🔮 今天吃什么？输入生日秒算！五行八卦解锁你的专属食运密码
描述：✨ 150+道菜品智能推荐 | 🎨 解锁幸运色、吉利方向...
预览图：[1200x630 精美预览图]
```

---

## 🔄 更新日志

### 2026-06-17

- ✅ 优化 Open Graph 标题和描述
- ✅ 添加微信分享优化标签
- ✅ 创建分享预览图 HTML 模板
- ✅ 添加图片尺寸元数据
- ✅ 优化关键词配置

---

## 📝 注意事项

1. **预览图必须上传到 GitHub**
   - 文件路径：`/share-preview.png`
   - 确保图片可以公开访问

2. **社交缓存更新**
   - Facebook/Twitter 会缓存分享预览
   - 修改后需要在调试工具中强制刷新

3. **微信分享**
   - 微信需要配置 JSSDK 才能自定义分享
   - 当前使用 Open Graph 标签作为后备

4. **图片尺寸**
   - 推荐：1200x630（1.91:1 比例）
   - 最小：600x315
   - 最大：5MB

---

## 🎯 下一步优化

1. **生成并上传预览图**
   - 使用上述方法生成 `share-preview.png`
   - 提交到 GitHub

2. **测试分享效果**
   - 在各大社交平台测试
   - 确保预览正常显示

3. **优化标题和描述**
   - 根据反馈调整文案
   - A/B 测试不同版本

4. **添加 favicon**
   - 创建网站图标
   - 提升品牌识别度
