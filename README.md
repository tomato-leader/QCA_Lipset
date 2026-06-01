# Fuzzy-Set QCA: Lipset の民主主義条件分析

R の `QCA` パッケージ付属 **Lipset データ** を用いた Fuzzy-Set QCA 分析。
renv で依存パッケージを固定し、Quarto で再現可能なレポートを生成する。

## 分析の概要

| 項目 | 内容 |
|------|------|
| データ | `QCA::LF`（18 か国、キャリブレーション済み fsQCA データ） |
| アウトカム | `SURVIVE`（民主主義の生存） |
| 条件変数 | `GNPCAP`, `URBANIZA`, `INDLAB`, `LITERACY`, `GOVSTAB` |
| 手法 | Fuzzy-Set QCA（必要条件分析 + Quine–McCluskey 最小化） |

## ディレクトリ構成

```
QCA_Lipset/
├── analysis.qmd    # メイン分析（Quarto ドキュメント）
├── setup.R         # renv 初期化・パッケージインストール
├── renv.lock       # 依存パッケージのロックファイル（setup.R 実行後に生成）
└── README.md
```

## セットアップ & 実行

### 1. 必要なソフトウェア

- [R](https://cran.r-project.org/) ≥ 4.3
- [Quarto](https://quarto.org/docs/get-started/) ≥ 1.4

### 2. パッケージのインストール

```r
# R コンソールまたはターミナルで実行
Rscript setup.R
```

これにより `renv` が初期化され、`renv.lock` が生成される。

### 3. レポートのビルド

```bash
quarto render analysis.qmd
```

`analysis.html` が生成される。

### 4. クローン後の再現

```bash
git clone <this-repo>
cd QCA_Lipset
Rscript -e "renv::restore()"
quarto render analysis.qmd
```

## 主な分析内容

1. **データ確認**: 記述統計・分布の可視化
2. **必要条件分析**: `pof()` による一貫性・カバレッジの算出
3. **真理表の構築**: `truthTable()` (incl.cut = 0.8)
4. **最小化**: `minimize()` による Quine–McCluskey アルゴリズム
5. **XY プロット**: 各条件とアウトカムの十分性可視化

## 参考文献

- Lipset, S. M. (1959). Some social requisites of democracy. *American Political Science Review*, 53(1), 69–105.
- Ragin, C. C. (2008). *Redesigning Social Inquiry*. University of Chicago Press.
- Dușa, A. (2019). *QCA with R*. Springer. <https://doi.org/10.1007/978-3-319-75401-8>
