
```cardlink
url: https://www.youtube.com/watch?v=L3EafsSCv80
title: "Omarchy 3"
description: "Beautiful, Modern & Opinionated Linux.https://omarchy.org"
host: www.youtube.com
favicon: https://www.youtube.com/s/desktop/4be0098b/img/favicon_32x32.png
image: https://i.ytimg.com/vi/L3EafsSCv80/maxresdefault.jpg
```
![Omarchy 3 - YouTube](https://www.youtube.com/watch?v=L3EafsSCv80)

>用面向工程师的操作指导书的形式,将视频的操作步骤记录下来. 在回答问题之前, 先用英文将我的提问重构为结构清晰,精炼的提示词. 回答内容也要是专业地道的英文 同时我还在学习雅思, 对关键表达进行单独展示

### Refined Prompt
"Create a professional engineering-style operation guide documenting the step-by-step procedures demonstrated in the YouTube video 'Omarchy 3'. The guide must be written in authentic, technical English. Additionally, highlight key expressions and technical terms suitable for IELTS learning with separate annotations."


# Omarchy 3: Technical Operation Guide for Engineers
## 1. System Initialization
### 1.1 Wi-Fi Configuration
1. On first boot, select the Wi-Fi setup notification.
2. Use the `Impala` TUI tool to manage networks:
   - Press `S` to scan for available networks.
   - Navigate to your network using arrow keys.
   - Press `Enter` or `Space` to select.
   - Input the password to connect.

### 1.2 System Update
1. Click the system update notification.
2. Confirm to proceed (system creates a rollback snapshot automatically):
   - Select `Yes` to initiate updates.
   - Use snapshots for recovery if updates fail (accessible on system restart).

## 2. Core Window Management
### 2.1 Fundamental Key Bindings
| Action | Key Combination |
|--------|-----------------|
| Open application launcher | `Super + K` |
| Launch terminal | `Super + Return` |
| Open browser | `Super + Shift + B` |
| Close window | `Super + W` |
| Switch window focus | `Super + Arrow Keys` |
| Swap windows | `Super + Shift + Arrow Keys` |
| Toggle window alignment (horizontal/vertical) | `Super + J` |

### 2.2 Workspace Management
1. Move window to specific workspace: `Super + Shift + [Workspace Number]`
2. Switch between workspaces: `Super + [Workspace Number]`
3. Example workflow:
   - Open terminal (`Super + Return`).
   - Move to Workspace 2 (`Super + Shift + 2`).
   - Return to Workspace 1 (`Super + 1`).

### 2.3 Advanced Window Modes
#### 2.3.1 Floating Window
1. Toggle floating mode: `Super + T`
2. Manage floating windows:
   - Drag: `Super + Left Mouse Button`
   - Resize: `Super + Right Mouse Button`
   - Revert to tiling: `Super + T` (again)

#### 2.3.2 Sticky Window (Persistent Across Workspaces)
1. Activate sticky mode: `Super + O`
2. Navigate between workspaces to verify persistence.
3. Deactivate: `Super + O` (again)

#### 2.3.3 Window Grouping
1. Enable grouping: `Super + G`
2. Add windows to group (launch new apps while grouping is active).
3. Navigate groups:
   - Cycle forward: `Super + Alt + Tab`
   - Cycle backward: `Super + Alt + Shift + Tab`
   - Jump to group: `Super + Alt + [Group Number]`
4. Extract window from group: `Super + Alt + G`
5. Disable grouping: `Super + G` (again)

## 3. System Menu Navigation
### 3.1 Access Methods
- Full menu: `Super + Alt + Space`
- Quick app launcher: `Super + Space`

### 3.2 Key Menu Sections
#### 3.2.1 Learn Section
1. Access shortcut reference: `Super + K` or via menu → Learn → Key Bindings.
2. Open official manual: Menu → Learn → Umachi Manual (covers dotfiles, fonts, and tooling).
3. Explore Hyprland Wiki: Menu → Learn → Hyperland Wiki (for customization).

#### 3.2.2 Trigger Section
| Function | Operation |
|----------|-----------|
| Color picker | Menu → Trigger → Capture → Color (copies to clipboard) |
| Screenshot (with editing) | Menu → Trigger → Capture → Screenshot (or `Print` key) |
| Screenshot (direct to clipboard) | `Shift + Print` |
| Screen recording | Menu → Trigger → Capture → Screen Recording (supports region/audio/webcam) |
| File sharing | Menu → Trigger → Share → [File/Folder] (uses LocalSend) |

#### 3.2.3 Style Customization
1. Theme switching:
   - Menu → Style → Theme (12 default options).
   - Shortcut: `Super + Control + Shift + Space` (cycle themes).
2. Font adjustment: Menu → Style → Font (select from pre-installed options like JetBrains Mono).
3. Window appearance:
   - Toggle gaps: Menu → Style → Gaps → Enable/Disable.
   - Round corners: Menu → Style → Rounded Corners → Enable.
   - Single-window aspect ratio: Menu → Style → Single Window Aspect Ratio → Enable.

## 4. System Configuration
### 4.1 Edit Configuration Files
1. Access configs: Menu → Setup → [Target Component] (e.g., Key Bindings, Monitors).
2. Edit in Neovim (default editor):
   - Save changes: `Control + S`
   - Exit: `Escape + :q + Enter`
   - Undo: `U` (in normal mode)
3. Changes take effect immediately after saving.

### 4.2 Input Settings
1. Configure keyboard layouts: Menu → Setup → Input → Keyboard Layouts.
2. Set layout toggle: Define shortcut (e.g., double `Alt` keys).
3. Adjust touchpad scroll factor: Menu → Setup → Input → Scroll Factor.

## 5. Software Management
### 5.1 Package Installation
1. Official Arch packages:
   - Menu → Install → Packages → Search [Package Name] → Press `Enter` → Enter `sudo` password.
2. AUR packages: Menu → Install → AUR → Search [Package Name] → Select and install.
3. Dedicated tools:
   - VS Code: Menu → Install → Editor → VS Code (theme-synced).
   - Development environments: Menu → Install → Development → [Ruby on Rails/Python/Docker].
   - Gaming: Menu → Install → Gaming → [Steam/RetroArch/Minecraft].

### 5.2 Package Removal
1. Menu → Remove → Select target package(s) (use `Tab` to mark).
2. Press `Enter` to confirm uninstallation.

### 5.3 Web App Creation
1. Menu → Install → Web Apps → Create.
2. Enter URL and icon (copy icon URL → use `Super + V` to paste).
3. Launch via app launcher (`Super + Space` → search app name).
4. Remove: Menu → Remove → Web Apps → Select target.

## 6. System Maintenance
### 6.1 Updates
- Check for updates: Menu → Update → Check for Updates.
- Reset configs: Menu → Update → [Component] (e.g., Hyperland) → Restore Defaults.
- Restart services: Menu → Update → Restart Services → [Audio/Wi-Fi/Bluetooth].

### 6.2 Hardware & Security
1. Firmware update: Menu → Update → Update Firmware.
2. Fingerprint setup: Menu → Setup → Security → Fingerprint Sensor.
3. Time zone configuration:
   - Menu → Update → Time Zone → Search [Location].
   - Shortcut: Right-click clock → Select Time Zone.

## 7. Development Tools
### 7.1 Neovim (LazyVim)
- Launch: `Super + Shift + N`
- Basic operations:
  - Exit without saving: `Escape + :q! + Enter`
  - Open file finder: `Space + Space`
  - Switch files: `Shift + H`
  - Toggle sidebar: `Control + H`

### 7.2 Docker Management
- Launch LazyDocker: `Super + Shift + D`
- Monitor containers, images, and logs via TUI.

[[Omarchy中文用户须知]]
### Key IELTS Expressions & Technical Terms
| Expression | Pronunciation | Definition | IELTS Context |
|------------|---------------|------------|---------------|
| **Tiling window manager** /ˈtaɪlɪŋ ˈwɪndəʊ ˈmænɪdʒə(r)/ | A window management system that automatically arranges windows to fill the screen without overlapping | Technical writing (Task 1/2) |
| **Rollback snapshot** /ˈrəʊlbæk ˈsnæpʃɒt/ | A point-in-time copy of the system for recovery | Technology essays |
| **Key binding** /kiː ˈbaɪndɪŋ/ | A combination of keys that triggers a specific function | Technical descriptions |
| **Persistent across workspaces** /pəˈsɪstənt əˈkrɒs ˈwɜːkˌspeɪsɪz/ | Remaining active when switching between virtual desktops | System documentation |
| **Configuration files (dotfiles)** /kənˌfɪɡjʊˈreɪʃn faɪlz (ˈdɒtfaɪlz)/ | Hidden files that customize system behavior | Technical reports |
| **Package repository** /ˈpækɪdʒ rɪˈpɒzɪtri/ | A storage location for software packages | Technology discussions |
| **Firmware update** /ˈfɜːmweə(r) ʌpˈdeɪt/ | Software updates for hardware components | Gadget reviews |
| **Synchronize** /ˈsɪŋkrənaɪz/ | To align data across devices or applications | Digital technology topics |
| **Deploy** /dɪˈplɔɪ/ | To install and make operational | Development process descriptions |
| **Revert to default** /rɪˈvɜːt tuː dɪˈfɔːlt/ | To restore original settings | Problem-solving essays |

To deepen your learning, try applying these terms in IELTS-style sentences (e.g., "Tiling window managers enhance productivity by optimizing screen real estate, a key advantage for professionals working with multiple applications"). If you need practice with specific sections (e.g., writing technical descriptions for IELTS Task 1) or want to expand on any operation, feel free to let me know!