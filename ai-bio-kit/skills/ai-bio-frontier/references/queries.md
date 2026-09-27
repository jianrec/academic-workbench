# 七域固定检索查询组（LLM 推理优化 × 缓存压缩）

按推理优化领域的七大任务域组织。检索窗口默认最近 3 天。每组执行：至少 1 条通用查询 + 1 条限定来源查询（限定 sources.md 白名单站点）。

## 域 1 · 推理引擎与 serving 系统

- `vLLM OR SGLang OR "TensorRT-LLM" OR "TGI" OR "inference engine"`（新论文/新版本/新特性）
- `"continuous batching" OR "LLM serving" OR "serving system"`（调度与吞吐优化）
- 各引擎 GitHub releases 新版本的性能声明（对照独立复现）

## 域 2 · KV cache 管理与长上下文

- `"KV cache" OR "paged attention" OR "prefix caching" OR RadixAttention`
- `"KV cache compression" OR "KV cache quantization" OR "KV cache offloading"`
- `"sparse attention" OR "sliding window attention" OR "long context" inference`
- 长上下文 serving 的显存/延迟独立评测

## 域 3 · 模型压缩与低精度推理

- `GPTQ OR AWQ OR "weight quantization" OR FP8 OR INT4 inference`
- `"knowledge distillation" LLM OR pruning OR sparsity`（面向推理加速的）
- 低精度带来的精度损失：独立基准 vs 自报数字

## 域 4 · 解码加速

- `"speculative decoding" OR Medusa OR EAGLE OR "draft model"`
- `"parallel decoding" OR "lookahead decoding"`；采样与验证开销的新分析
- 推理模型（长思维链）场景的解码加速新工作

## 域 5 · 并行与分布式推理

- `"tensor parallelism" OR "pipeline parallelism" OR "expert parallelism"` inference
- `"disaggregated" prefill decode OR "PD disaggregation" OR Mooncake OR DistServe`
- MoE serving、集群级调度与路由

## 域 6 · 编译器与算子优化

- `FlashAttention OR Triton kernel OR "CUDA graph" OR "torch.compile"` inference
- `"fused kernel" attention OR "attention kernel"`；新算子的独立 benchmark
- 新硬件后端（AMD/TPU/国产芯片）的算子适配进展

## 域 7 · 硬件与算力

- `B200 OR GB200 OR H200 inference benchmark`；显存带宽/互联对推理的约束分析
- 推理成本经济性：tokens/美元、每 token 能耗的可靠测算
- MLPerf Inference 新结果（以 mlcommons.org 官方为准）

## 横向查询（每次必查）

- 开源引擎版本发布：vLLM、SGLang、TensorRT-LLM 的 GitHub releases 与官方博客
- 顶会动态：MLSys / OSDI / SOSP / NSDI / ASPLOS / EuroSys / NeurIPS / ICML 的接收列表、best paper、开源 artifact
- 模型厂技术报告中的推理系统设计（DeepSeek、Qwen、Meta、Google、OpenAI、Anthropic，标注「单一来源」）

## 检索纪律

1. 查询词以英文为主（该领域一手文献与技术发布以英文为主），说明性检索可中文
2. 命中后回源访问；博客摘要不足以核对三要素时，进入论文正文或 GitHub 仓库核对
3. 转载报道只作线索，溯源后按一手来源分级
4. 查询与排除过程不写入日报正文；全部来源链接统一收入日报「参考来源」区
