# DuelystImgPath
Bash script to add image paths to the json database of Duelyst.

Given a card in with the following json data:
```
  {
    "id": 1,
    "faction": "Lyonar Kingdoms",
    "rarity": "Basic",
    "name": "Argeon Highmayne",
    "description": "Bloodborn Spell: Give a minion nearby your General +2 Attack.",
    "manaCost": 0,
    "type": "Unit",
    "race": "",
    "attack": 2,
    "health": 25
  }
```

The data will be appended with imgpath field `"imgpath": "Lyonar/ArgeonHighmayne.png"`.
For example:
```
  {
    "id": 1,
    "faction": "Lyonar Kingdoms",
    "rarity": "Basic",
    "name": "Argeon Highmayne",
    "description": "Bloodborn Spell: Give a minion nearby your General +2 Attack.",
    "manaCost": 0,
    "type": "Unit",
    "race": "",
    "attack": 2,
    "health": 25,
    "imgpath": "Lyonar/ArgeonHighmayne.png"
  }
```

## Usage
`./duelystimgpath [inputfile] [output file]`

If no output file is specified, the script outputs to out.json.

Example: `./duelystimgpath.sh cards.json cards_with_path.json`

## Requirements
- You will need a bash terminal. 
- You will need jq.

## Instructions
### Windows
- Windows 10 Anniversary provides a functional unix-like (Ubuntu) terminal. This *should* work.
- Install Ubuntu for Windows.
- sudo apt-get install jq
- Navigate to cards.json.
- ./duelystimgpath [input file] [output file]

### OS X
- Install Homebrew (if not already installed).
- brew install jq
- Navigate to cards.json.
- ./duelystimgpath [input file] [output file]
