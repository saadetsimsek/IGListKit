# IGListKit

*Instagram's collection view framework, set up with section controllers and an empty state.*

![Swift](https://img.shields.io/badge/Swift-5.0-F05138?style=flat-square&logo=swift&logoColor=white) ![UIKit](https://img.shields.io/badge/UIKit-2396F3?style=flat-square&logo=uikit&logoColor=white) ![iOS](https://img.shields.io/badge/iOS-17.5%2B-000000?style=flat-square&logo=apple&logoColor=white) ![Topic](https://img.shields.io/badge/topic-IGListKit-6366F1?style=flat-square) ![Package](https://img.shields.io/badge/IGListKit-8B5CF6?style=flat-square)

## Overview

IGListKit replaces the data source with an adapter that asks for objects and returns a section controller for each. Updates are computed by diffing rather than applied by index, which is the same idea Apple later shipped as diffable data sources.

## How it works

```mermaid
flowchart TD
    VC["ViewController"] --> AD["ListAdapter"]
    AD --> DS["ListAdapterDataSource"]
    DS --> OBJ["objects(for:)<br/>the model array"]
    DS --> SC["listAdapter(_:sectionControllerFor:)"]
    DS --> EMPTY["emptyView(for:)<br/>shown when objects is empty"]
    SC --> LSC["LabelSectionController"]
    LSC --> N1["numberOfItems"]
    LSC --> N2["cellForItem(at:)"]
    LSC --> N3["sizeForItem(at:)"]
    LSC --> N4["didUpdate(to object:)"]
    LSC --> N5["didSelectItem(at:)"]
    N2 --> CELL["CollectionViewCell"]
```

## Implementation notes

- **One section controller per object.** Each model owns its own sizing, cell and selection behaviour, so a mixed feed is a list of controllers rather than a switch statement.
- **Diffing requires ListDiffable.** Objects supply a diff identifier and an equality check, which is how the adapter decides what moved and what changed.
- **Empty state built in.** `emptyView(for:)` is part of the data source, so the empty case is not an extra overlay managed by the controller.
- **prepareForReuse implemented.** The cell clears its label, since the adapter recycles cells the same way UIKit does.

## Project structure

```
IGListKitt/
├── ViewController.swift       adapter and data source
├── SectionController.swift    LabelSectionController
└── CollectionViewCell.swift
```

## Requirements

Xcode 15 or later, iOS 17.5 or later, Swift Package Manager for IGListKit.
