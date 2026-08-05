# Default Avatar

*Generated initials avatars for users without a profile photo.*

![Swift](https://img.shields.io/badge/Swift-5.0-F05138?style=flat-square&logo=swift&logoColor=white) ![UIKit](https://img.shields.io/badge/UIKit-2396F3?style=flat-square&logo=uikit&logoColor=white) ![iOS](https://img.shields.io/badge/iOS-17.5%2B-000000?style=flat-square&logo=apple&logoColor=white) ![Topic](https://img.shields.io/badge/topic-text%20derived%20UI-6366F1?style=flat-square) ![Dependencies](https://img.shields.io/badge/dependencies-none-16A34A?style=flat-square)

## Overview

Every contact list needs a fallback for the missing profile picture. This one derives the initials from the name, renders them on a coloured circle, and lets new entries be added through an alert with a text field.

## How it works

```mermaid
flowchart TD
    ADD["Add button"] --> AM["AlertManager.showTextFieldsAlert"]
    AM --> NAME["entered name"]
    NAME --> VC["ViewController.addUser"]
    VC --> LIST["names array"]
    LIST --> CELL["CustomTableViewCell.configure(userName:)"]
    CELL --> EXT["String.getFirstSembols()<br/>leading letters of each word"]
    EXT --> AVATAR["initials drawn on a circular label"]
```

## Implementation notes

- **Initials from a string extension.** `getFirstSembols` handles single and multi word names, so the cell receives a ready string.
- **Alerts behind a manager.** `AlertManager` builds the text field alert and returns the entered value through a completion handler, keeping the controller free of alert construction.
- **Row height fixed deliberately.** `heightForRowAt` returns a constant so the circular avatar keeps its aspect ratio regardless of the name length.
- **No image assets involved.** The avatar is a label on a rounded view, which means no download, no cache and no placeholder handling.

## Project structure

```
DefaultAvatar/
├── Cells/        CustomTableViewCell
├── Service/      AlertManager
├── Controller/   ViewController
└── Extensions/   String+Extensions
```

## Requirements

Xcode 15 or later, iOS 17.5 or later. No external dependencies.
