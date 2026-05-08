# Narra-Table Agent Skills

Narra-Table 团队共享的 Agent Skills 仓库。这里收录团队约定好的、面向 AI 编码助手（Claude Code、Cursor、Copilot、Codex、Hermes、opencode 等）的可复用「技能」，让不同成员、不同工具用一致的工作方式协作。

---

## 推荐：用 skillshare 管理

强烈推荐通过 [skillshare](https://github.com/runkids/skillshare) 来安装、同步、更新这个仓库里的 skill。skillshare 是一个跨 AI CLI 工具的统一管理器，一份源、一条命令同步到所有目标工具，自带备份和回滚，可以省掉手工搬文件、自己维护各工具配置路径的所有麻烦。

### 一次性初始化

如果你还没用过 skillshare，先装它：
 
#### macOS / Linux

```bash
curl -fsSL https://raw.githubusercontent.com/runkids/skillshare/main/install.sh | sh
skillshare init     # 在 ~/.config/skillshare/ 创建源目录与配置
```

#### Windows PowerShell

```bash
irm https://raw.githubusercontent.com/runkids/skillshare/main/install.ps1 | iex
skillshare init     # 在 ~/.config/skillshare/ 创建源目录与配置
```

或参考仓库 README 选其它安装方式。

### 把这个仓库装进来

```bash
skillshare install https://github.com/Narra-Table/skills.git
skillshare sync
```

`install` 会把仓库里 `skills/` 下的所有 skill 拷进 skillshare 源目录（`~/.config/skillshare/skills/`），`sync` 把源分发到你已经配置的所有目标工具的 skill 目录。后续团队更新仓库后，跑：

```bash
skillshare check          # 看哪些 skill 有更新
skillshare update --all   # 拉取并重新分发
```

---

## 各工具使用须知

skillshare 会替你把 skill 文件放到下面这些路径。如果你不用 skillshare，需要手工把 `skills/<name>/` 整个目录拷到对应位置。

### Claude Code

- **路径**：`~/.claude/skills/`

### Cursor

- **路径**：`~/.cursor/skills/`

### GitHub Copilot

- **路径**：`~/.copilot/skills/`

### Codex（OpenAI Codex CLI）

- **路径**：`~/.agents/skills/` 

### Hermes

- **路径**：`~/.hermes/skills/`

### opencode

- **路径**：`~/.config/opencode/skills/`

### skillshare

- **路径**：`~/.config/skillshare/skills/`

---

## 添加一个新 skill

1. 先在本地创建一个 skill（任何方式，自己手写或者让 anget 帮写）。

2. 使用自己本地的工具验证一遍，确认 skill 真的能改变 agent 的行为，并且符合你的需求。

3. 再在 `skills/` 下新建目录，注意确保按照 skill 的通用格式：

   请参考：https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview

4. 合并后，其余成员可以跑 `skillshare update --all` 拉到本地。

---

## License

[MIT](LICENSE)
