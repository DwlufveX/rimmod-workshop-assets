# RimMod Workshop assets

Public artwork for DwlufveX’s published RimWorld mods.

## Current Workshop images

Captured from all 7 public items on 2026-11-17, including English and Simplified Chinese descriptions, covers and galleries. Identical bytes within a Mod are reused. [workshop-index.json](workshop-index.json) records source URLs, ordering, languages and SHA-256 hashes.

| Mod | Images | Workshop |
| --- | ---: | --- |
| [RoleWardrobe](RoleWardrobe/README.md) | 1 | [3838215998](https://steamcommunity.com/sharedfiles/filedetails/?id=3838215998) |
| [PsycastTrade](PsycastTrade/README.md) | 11 | [3834224553](https://steamcommunity.com/sharedfiles/filedetails/?id=3834224553) |
| [PersonalPaths](PersonalPaths/README.md) | 16 | [3828785758](https://steamcommunity.com/sharedfiles/filedetails/?id=3828785758) |
| [Geomancer](Geomancer/README.md) | 11 | [3828785749](https://steamcommunity.com/sharedfiles/filedetails/?id=3828785749) |
| [DriverShifts](DriverShifts/README.md) | 1 | [3819033810](https://steamcommunity.com/sharedfiles/filedetails/?id=3819033810) |
| [AutomatedMedicalSystem](AutomatedMedicalSystem/README.md) | 11 | [3819033089](https://steamcommunity.com/sharedfiles/filedetails/?id=3819033089) |
| [Sanctum](Sanctum/README.md) | 10 | [3816884275](https://steamcommunity.com/sharedfiles/filedetails/?id=3816884275) |

## Publishing workflow

Upload new images to the matching Mod directory, verify downloaded bytes, then use commit-pinned raw GitHub URLs in Workshop descriptions. Keep gallery order and language mappings in workshop-index.json. Remove Steam gallery entries only after replacement links have been verified and the gallery migration is performed. This snapshot does not change Steam pages.

Never rewrite history or delete published image paths. Existing guide paths, index.json and Tools remain compatible. skipped.json describes the older guide-only import, not current coverage.

URL format: `https://raw.githubusercontent.com/DwlufveX/rimmod-workshop-assets/<commit>/<path>`.
