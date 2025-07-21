# Brick Breaker in Assembly

Brick Breaker Arena is a multi-level arcade game developed in x86 Assembly Language. This project demonstrates advanced low-level programming concepts, including graphics programming, real-time input handling, file operations, and game logic implementation.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Gameplay](#gameplay)
- [Controls](#controls)
- [Levels & Difficulty](#levels--difficulty)
- [Score & Lives](#score--lives)
- [File Handling](#file-handling)
- [Technical Details](#technical-details)
- [How to Run](#how-to-run)
- [Credits](#credits)

---

## Overview
Brick Breaker Arena is a classic arcade-style game where the player controls a paddle to bounce a ball and break bricks arranged at the top of the screen. The game is implemented entirely in Assembly, utilizing BIOS and DOS interrupts for graphics, keyboard input, and file management.

## Features
- **Multi-level gameplay:** Three levels with increasing difficulty and brick durability.
- **Real-time paddle and ball mechanics:** Smooth movement and collision detection.
- **Score tracking:** Real-time display and persistent storage of player scores.
- **Lives system:** Players have three lives per game.
- **Timer:** Four-minute countdown timer for each session.
- **Sound effects:** Audible feedback on brick collisions and events.
- **Interactive menus:** Main menu, instructions, and record viewing screens.
- **File handling:** Player names and scores are saved and can be viewed from the menu.

## Gameplay
1. **Introduction Screen:** Displays the game title and prompts the player to continue.
2. **Name Entry:** Player is prompted to enter their name, which is saved for score records.
3. **Main Menu:** Options include starting a level (1-3), viewing instructions, or viewing records.
4. **Game Screen:**
   - The player controls a paddle at the bottom of the screen to keep the ball in play.
   - The objective is to break all bricks by bouncing the ball off the paddle.
   - The game ends when all bricks are destroyed (win) or all lives are lost/time runs out (game over).
5. **Score and Records:** At game over or win, the player's name and score are saved to a file and can be viewed from the menu.

## Controls
- **Left Arrow (←):** Move paddle left
- **Right Arrow (→):** Move paddle right
- **Enter:** Pause/resume the game
- **Esc:** Exit to menu or quit

## Levels & Difficulty
- **Level 1:** Standard speed, bricks require one hit to break.
- **Level 2:** Increased ball speed, bricks require two hits (color changes after first hit).
- **Level 3:** Fastest ball speed, bricks require three hits (color changes with each hit), and some bricks trigger special effects.

## Score & Lives
- **Score:** Displayed in the game UI, increments as bricks are destroyed.
- **Lives:** Three lives per game, displayed as icons. Losing the ball reduces a life; losing all lives ends the game.
- **Timer:** Four-minute countdown; game ends if timer reaches zero.

## File Handling
- **Player Name & Score Storage:**
  - Player names and scores are appended to `player.txt` after each game session.
  - The records can be viewed from the main menu (option 5: Record).
- **File Operations:**
  - Uses DOS interrupts for file open, write, and close operations.
  - Handles both new and existing files.

## Technical Details
- **Language:** x86 Assembly (MASM/TASM syntax)
- **Graphics:** VGA mode (INT 10h) for drawing bricks, paddle, ball, and UI elements.
- **Input:** Keyboard input via BIOS (INT 16h) and DOS (INT 21h) interrupts.
- **Sound:** PC speaker beeps for feedback (OUT 61h/43h/42h).
- **Game Logic:**
  - Collision detection for ball, paddle, and bricks
  - Dynamic brick color and durability
  - Real-time score, lives, and timer updates
- **Menus:** Text-based, interactive, with clear navigation and instructions

## How to Run
1. **Requirements:**
   - DOSBox or a real DOS environment
   - MASM/TASM assembler and linker
2. **Build Instructions:**
   - Assemble and link `code.asm` using your assembler (e.g., `masm code.asm; link code.obj;`).
   - Run the resulting executable in DOSBox or compatible environment.
3. **Controls:**
   - Use the keyboard as described above to play and navigate menus.

## Credits
- Developed as a university project for Computer Organization and Assembly Language (COAL).

## COntributions
- Mohammad Faizan
- Minha Rehman
---

Enjoy breaking bricks and mastering Assembly programming!
