# 分级源清单（LLM 推理优化 × 缓存压缩）

检索入口白名单。命中任何来源后必须回源访问原文；转载媒体一律降级为线索。

## 一、同行评议会议（新发表首选）

- **系统主战场**：OSDI、SOSP、NSDI、USENIX ATC、EuroSys（usenix.org / dl.acm.org 官方论文页）
- **ML 系统专会**：MLSys（mlsys.org / proceedings.mlr.press）
- **体系结构**：ASPLOS、ISCA、MICRO、HPCA（推理硬件/算子侧）
- **AI 方法侧**：NeurIPS / ICML / ICLR（解码加速、压缩、注意力新方法；OpenReview 可查评审）

## 二、预印本服务器（标注「预印本」）

- **arXiv cs.DC**（分布式计算：serving 系统主阵地）
- **arXiv cs.LG / cs.CL**（解码加速、压缩方法）
- **arXiv cs.AR**（硬件与体系结构）

## 三、官方与机构（企业声明一律标注「单一来源」）

**开源引擎与官方渠道（版本与特性的一手来源）**
- vLLM：blog.vllm.ai 与 github.com/vllm-project/vllm releases
- SGLang：sglang.ai 博客与 github.com/sgl-project/sglang releases
- NVIDIA：TensorRT-LLM GitHub、developer.nvidia.com 技术博客
- Hugging Face：huggingface.co/blog（TGI、推理生态）

**评测与基准（可信度高，属机构数据而非营销）**
- MLCommons（mlcommons.org）：MLPerf Inference 官方结果
- OpenReview（会议公开评审，独立同行意见）

**模型厂技术报告（仅可公开验证的产出，标注「单一来源」）**
- DeepSeek、Qwen、Meta、Google、OpenAI、Anthropic 的技术报告与系统博客

## 四、权威媒体与分析机构（仅背景交叉，不作主源）

- SemiAnalysis（算力与推理经济学深度分析，付费墙内内容标注可及性）
- Interconnects（Nathan Lambert）/ Chip Huyen 博客（ML 系统评论，二手）
- The Information / 机器之心等（仅线索，必须溯源）

## 五、会议与届次

- MLSys 年会（论文集 PMLR 免费全文）
- USENIX 系列（OSDI/NSDI/ATC，官网全文免费）
- ACM 系列（SOSP/ASPLOS，DL 摘要可查；artifact 以 GitHub 为准）

## 六、排除项

- 社交媒体、自媒体、营销稿、融资消息（除非作为「传播现象」的研究对象）
- 无 benchmark 三要素（指标/模型精度/硬件并发配置）的「最快」「数量级提升」宣称——进待核实清单
- 供应商对比评测中未公开脚本的数字（利益相关，单源）
