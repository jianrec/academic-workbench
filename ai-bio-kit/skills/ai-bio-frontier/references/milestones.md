# 里程碑锚点（LLM 推理优化 × 缓存压缩）

用途：判断新进展「是否真的新」「是否改变既有格局」。核实状态：以下锚点由部署 Agent 按公开资料整理（截至 2026-09 的领域共识）。发现与新检索冲突的信息时，以新的一手来源为准，并在日报「里程碑对照」区记录修订。

## 一、事实锚点（领域共识）

| 年份 | 事件 | 关键数值/事实 |
|---|---|---|
| 2017 | Transformer（NeurIPS） | 自注意力架构，自回归解码的串行瓶颈由此确立 |
| 2019 | Megatron-LM | 张量并行成为大模型训练/推理的标准切分方式 |
| 2022 | FlashAttention（Tri Dao 等） | IO 感知的精确注意力，显存访问降一个数量级 |
| 2022 | Orca（OSDI'22） | continuous batching（iteration-level scheduling）使 serving 吞吐数倍提升 |
| 2023 | vLLM / PagedAttention（SOSP'23） | 显存分页管理 KV cache，碎片近零，成为开源 serving 事实标准 |
| 2023 | 推测解码实用化（Leviathan et al. 2023；Medusa、EAGLE 跟进） | 小模型起草、大模型并行验证，解码加速 2–3 倍且输出无损 |
| 2023 | GPTQ / AWQ | 训练后权重量化（INT4/INT3）进入实用，单卡可跑大模型 |
| 2023 | H100 + FP8（Transformer Engine） | 推理硬件代际切换，FP8 进入主流推理栈 |
| 2024 | DeepSeek-V2 MLA | 低秩联合压缩 KV cache，长上下文 KV 显存降一个数量级 |
| 2024 | Splitwise / DistServe / Mooncake | prefill-decode 分离（PD 分离）成为大集群 serving 新架构 |
| 2024 | SGLang RadixAttention | 前缀树复用 KV cache，多轮/共享前缀场景吞吐显著提升 |
| 2024 | FP8 KV cache 量化普及 | KV cache 从 FP16 走向 FP8/INT8，长上下文成本继续下探 |
| 2025 | DeepSeek-R1 引发推理模型浪潮 | 长思维链使解码长度数量级增长，KV cache 与解码成本成为主要矛盾 |
| 2025 | Blackwell（B200/GB200）规模部署 | 推理集群代际更新，NVLink 域扩大改变并行策略 |
| 2025–26 | 稀疏注意力复兴（NSA、MoBA 等） | 面向长上下文的训练原生稀疏注意力进入主线模型 |

## 二、分析性锚点（部署时整理的判断，非事实）

对照新证据时应检验而非默认沿用：

1. 自回归解码是显存带宽瓶颈（memory-bound）：batch 内每 token 都要全量读权重与 KV cache；优化首先围绕「少读显存」展开
2. PagedAttention + continuous batching 已成品类基线：新 serving 系统的提升应相对此基线衡量，而非相对朴素实现
3. 吞吐与延迟存在根本权衡，报告数字必须带三要素：吞吐/TTFT/TPOT × 模型与精度 × 硬件与并发；缺项的自报 benchmark 不可比
4. 系统优化收益常与模型代际红利交织：同一引擎跑新一代模型的提升，不等于引擎本身的提升
5. 长上下文时代 KV cache 是核心资源：压缩、量化、稀疏化、层级化（offload）四条路线并存，尚无统一胜出者

## 三、维护规则

- 每次发现「首次」「突破」类声明时，先对照本表：若为既有锚点的重复传播，降级处理
- 真正的新锚点须双源验证后补入本表（附来源与日期），同步在日报中说明
- 数值类锚点（如引擎版本、硬件规格）随官方发布页更新
