### 3. RFM解释

**RFM模型**是一种用于客户价值分析的工具，通过三个维度对客户进行分类和评分：
- **R（Recency）**：客户最近一次消费的时间间隔。时间间隔越短，客户价值越高。
- **F（Frequency）**：客户在某一时间段内的消费频率。频率越高，客户价值越高。
- **M（Monetary）**：客户在某一时间段内的消费金额。金额越高，客户价值越高。

**应用场景**：
- 客户细分：根据RFM评分将客户分为高价值客户、潜在客户、流失客户等。
- 精准营销：针对不同分组的客户制定差异化的营销策略。

---

### 4. 归一化是否了解

**归一化**是将数据按比例缩放到特定范围（如0到1）的过程，常用于消除量纲影响，使不同特征具有可比性。

**常见方法**：
1. **最小-最大归一化**：
   \[
   X_{\text{norm}} = \frac{X - X_{\min}}{X_{\max} - X_{\min}}
   \]
   - 将数据缩放到[0, 1]范围。
2. **Z-score标准化**：
   \[
   X_{\text{norm}} = \frac{X - \mu}{\sigma}
   \]
   - 将数据转换为均值为0、标准差为1的分布。

**应用场景**：
- 机器学习模型训练：如KNN、SVM等对特征尺度敏感的模型。
- 数据可视化：使不同特征在同一尺度下进行比较。

---

### 5. 评分系统设计与分层

**评分系统设计**：
1. **确定评分维度**：如RFM模型中的R、F、M。
2. **评分规则**：为每个维度设定评分标准（如1-5分）。
3. **权重分配**：根据业务需求为不同维度分配权重。
4. **总分计算**：加权求和得到客户的总评分。
5. **分层**：根据总分将客户分为不同层级（如高价值、中价值、低价值）。

**示例**：
- R（最近消费）：1-5分
- F（消费频率）：1-5分
- M（消费金额）：1-5分
- 总分 = R * 0.4 + F * 0.3 + M * 0.3
- 分层：
  - 高价值客户：总分 ≥ 4
  - 中价值客户：2 ≤ 总分 < 4
  - 低价值客户：总分 < 2

---

### 6. SQL `COUNT()`、`COUNT(1)`和`COUNT(*)`区别

- **`COUNT(*)`**：统计所有行数，包括NULL值。
- **`COUNT(1)`**：统计所有行数，`1`是常量，效果与`COUNT(*)`相同。
- **`COUNT(列名)`**：统计指定列中非NULL值的行数。

**区别**：
- `COUNT(*)`和`COUNT(1)`性能几乎相同，通常推荐使用`COUNT(*)`。
- `COUNT(列名)`会忽略NULL值，统计结果可能小于`COUNT(*)`。

---

### 7. LEFT、RIGHT、INNER、FULL JOIN解释

- **INNER JOIN**：返回两个表中匹配的行。
- **LEFT JOIN**：返回左表的所有行，右表中匹配的行；右表无匹配时返回NULL。
- **RIGHT JOIN**：返回右表的所有行，左表中匹配的行；左表无匹配时返回NULL。
- **FULL JOIN**：返回两个表中所有行，无匹配的行用NULL填充。

**MySQL是否支持FULL JOIN**：
- MySQL不支持`FULL JOIN`，但可以通过`LEFT JOIN`和`RIGHT JOIN`的`UNION`实现。

---

### 8. 实现全连接和内连接

**全连接（FULL JOIN）**：
```sql
SELECT * FROM table1
LEFT JOIN table2 ON table1.id = table2.id
UNION
SELECT * FROM table1
RIGHT JOIN table2 ON table1.id = table2.id;
```

**内连接（INNER JOIN）**：
```sql
SELECT * FROM table1
INNER JOIN table2 ON table1.id = table2.id;
```

---

### 9. 力扣SQL题：自连接

**题目**：查找表中工资高于经理的员工。

**表结构**：
```sql
Employee (id, name, salary, manager_id)
```

**SQL语句**：
```sql
SELECT e1.name AS Employee
FROM Employee e1
JOIN Employee e2 ON e1.manager_id = e2.id
WHERE e1.salary > e2.salary;
```

---

### 10. 窗口函数 `DENSE_RANK()`和`RANK()`区别

- **`RANK()`**：相同值的行排名相同，但会跳过后续排名（如1, 2, 2, 4）。
- **`DENSE_RANK()`**：相同值的行排名相同，但不会跳过后续排名（如1, 2, 2, 3）。

---

### 11. Python列表与元组的区别

- **列表（List）**：
  - 可变：可以修改、添加、删除元素。
  - 使用方括号`[]`定义。
- **元组（Tuple）**：
  - 不可变：创建后不能修改。
  - 使用圆括号`()`定义。

---

### 12. Python Pandas知识

- **`replace()`**：替换数据中的值。
  ```python
  df.replace({'old_value': 'new_value'})
  ```
- **`fillna()`**：填充缺失值。
  ```python
  df.fillna(value)
  ```

---

### 13. 优惠券项目：缺失值处理

**缺失值处理**：
1. **删除**：删除缺失值较多的行或列。
2. **填充**：
   - 用均值、中位数、众数填充。
   - 用固定值填充（如0或“未知”）。
3. **插值**：使用插值法填充缺失值。

**设置优惠券**：
- 根据用户行为（如消费金额、频率）发放不同面额的优惠券。
- 设置有效期和使用条件（如满减、折扣）。

**示例**：
```python
df['discount'] = df['discount'].fillna(0)  # 缺失值填充为0
df['coupon'] = df['amount'].apply(lambda x: '10% off' if x > 100 else '5% off')
```