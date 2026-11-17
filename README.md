# RimMod Workshop assets

Images for DwlufveX's RimWorld mods' Workshop descriptions.

Never rewrite history. Never delete files referenced by a published description.
Always link by commit SHA:
`https://raw.githubusercontent.com/<owner>/rimmod-workshop-assets/<commit-sha>/<path>`

Layout: `<ModKey>/<Key>.<lang>.<ext>`; languages are `en` and `zh-CN`.
`index.json` records verified images and their original media entry names and source paths.
`skipped.json` lists missing files, hash mismatches, and excluded gallery entries.
Source paths are resolved relative to `E:\Project\RimMod\Fixes\PsycastSanctum`.
Only current `Modules/Release/Media/*.json` manifests are used; backups are ignored.
PsycastTrade uses the current 1.2.0 phase-1 configuration.

```powershell
.\Tools\Verify-Index.ps1
.\Tools\Get-PinnedUrl.ps1 -Owner YOUR_GITHUB_ACCOUNT
.\Tools\Get-PinnedUrl.ps1 -Owner YOUR_GITHUB_ACCOUNT -Commit FULL_COMMIT_SHA
```

## 中文

本仓库用于存放 DwlufveX 的 RimWorld 模组创意工坊描述图片。
禁止重写历史；禁止删除已发布描述引用的文件；图片链接必须固定到提交 SHA。
目录格式为 `<ModKey>/<Key>.<lang>.<ext>`，语言使用 `en` 和 `zh-CN`。
仅复制当前媒体 JSON 中源文件存在且 SHA-256 匹配的描述/指南图，不修改源文件。
`index.json` 保存图片索引与来源；`skipped.json` 逐项记录缺失、哈希不匹配及范围外的画廊条目。
本次只建立本地仓库，不设置远程、不推送。
