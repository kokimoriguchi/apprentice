# データを絞り込むことができる
## 1. 指定した行数のみ取得
従業員データ(employees テーブル)を10行のみ取得してください。
SELECT * FROM employees LIMIT 10;
## 2. 等しいデータの絞り込み
従業員のうち、女性のデータを10行分取得してください。
SELECT * FROM employees WHERE gender = "F" LIMIT 10;
## 3. 等しくないデータの絞り込み
従業員のうち、女性でないデータを10行分取得してください。その際、否定形の構文を使用してください。
SELECT * FROM employees WHERE NOT gender = "F" LIMIT 10;
## 4. より大きいデータの絞り込み
従業員のうち、誕生日が1960年1月1日以降の人のデータを10行分取得してください。
SELECT * FROM employees WHERE birth_date >= '1960-01-01' LIMIT 10;
## 5. あいまいな条件の絞り込み
従業員のうち、ファーストネームに vi が含まれる人のデータを10行分取得してください。
SELECT * FROM employees WHERE first_name LIKE '%vi%' LIMIT 10;
## 6. 特定の範囲の絞り込み
従業員のうち、誕生日が1960年1月1日から1960年1月31日までの人のデータを10行分取得してください。
SELECT * FROM employees WHERE birth_date BETWEEN '1960-01-01' AND '1960-01-31' LIMIT 10;
## 7. かつ
従業員のうち、ファーストネームが Mary で、かつ女性のデータを取得してください。
SELECT * FROM employees WHERE first_name = "Mary" AND gender = "F";
## 8. または
従業員のうち、ファーストネームが Mary または ラストネームが Peck の人のデータを10行分取得してください。
SELECT * FROM employees WHERE first_name = "Mary" OR last_name = "Peck" LIMIT 10;
## 9. 含まれる
従業員のうち、従業員番号が 10011, 10021, 10031 のいずれかに合致する人のデータを取得してください。なお、OR 演算子は使用しないでください。
SELECT * FROM employees WHERE emp_no IN (10011, 10021, 10031);
## 10. 従業員番号
従業員番号（emp_no）が20,000の人のファーストネームとラストネームを取得してください。
SELECT first_name, last_name FROM employees WHERE emp_no = 20000;
## 11. 誕生日
誕生日が1959年1月の人のレコードを取得してください。
SELECT * FROM employees WHERE birth_date BETWEEN '1959-01-01' AND '1959-01-31';

# 検索結果の並び替えができる
## 1. 昇順の並び替え
従業員を誕生日の昇順に並び替え、年齢が高い人トップ10のレコードを取得してください。
SELECT * FROM employees ORDER BY birth_date LIMIT 10;
## 2. 降順の並び替え
従業員を誕生日の降順に並び替え、年齢が若い人トップ10のレコードを取得してください。
SELECT * FROM employees ORDER BY birth_date DESC LIMIT 10;
## 3. 複数条件の並び替え
従業員を、年齢が高い順に並び替え、誕生日が同じなら雇った日付が最近の順で並び替え、トップ30のレコードを取得してください。
SELECT * FROM employees ORDER BY birth_date, hire_date LIMIT 10;

# データを集計できる
## 1. 列の合計値
給与情報(salaries テーブル)から、全データの給与の合計値を求めてください。
SELECT COUNT(*) FROM salaries;
## 2. 列の平均値
給与情報から、全データの給与の平均値を求めてください。
SELECT AVG(salary) FROM salaries;
## 3. 四捨五入
給与の平均値は小数点で取得されたかと思います。給与の平均値を四捨五入して整数で求めてください。
SELECT ROUND(AVG(salary)) FROM salaries;
## 3. 列の最大値
給与情報から、全データの給与の最大値を求めてください。
SELECT MAX(salary) FROM salaries;
## 4. 列の最小値
給与情報から、全データの給与の最小値を求めてください。
SELECT MIN(salary) FROM salaries;
## 5. 行数
給与情報から、全データの行数を求めてください。
SELECT COUNT(*) FROM salaries;
## 6. 絞り込みとの組み合わせ
from_date が1986年6月26日の従業員の最大給与を取得してください。
SELECT MAX(salary) FROM salaries WHERE from_date = "1986-06-26";
## 7. 少数第1桁
to_date が1991年6月26日の従業員の平均給与を少数第1桁で取得してください。
SELECT ROUND(AVG(salary), 1) FROM salaries WHERE to_date='1991-06-26';

# データをグルーピングできる
## 1. グルーピング
給与情報(salaries テーブル)から、従業員ごとに salary が何レコード登録されているかを取得し、従業員番号と登録レコード数を10件表示してください。
SELECT emp_no, COUNT(*) AS salary_record FROM salaries GROUP BY emp_no LIMIT 10;
## 2. グルーピングと集計関数
従業員番号10001から10010の従業員ごとの最小給与と最大給与を取得してください。
SELECT emp_no, MAX(salary) AS max_salary, MIN(salary) AS min_salary FROM salaries WHERE emp_no BETWEEN "10001" AND "10010" GROUP BY emp_no;
## 3. グルーピングと集計関数2
従業員番号10001から10010の従業員ごとの勤務開始日と勤務終了日を取得してください。なお勤務中の場合、勤務終了日は 9999-01-01 となります。
SELECT emp_no, MIN(from_date) AS start, MAX(to_date) AS end FROM salaries WHERE emp_no BETWEEN 10001 AND 10010 GROUP BY emp_no;
## 4. 絞り込み
従業員ごとの最大給与を求め、そのうち最大給与が140,000を超えている従業員の従業員番号と最大給与を取得してください。
SELECT emp_no, MAX(salary) AS max_salary FROM salaries GROUP BY emp_no HAVING MAX(salary) > 140000;
## 5. 最小給与
従業員番号10001から10100の従業員のうち、最小給与が40,000を下回っている従業員の従業員番号とその最小給与を取得してください。
SELECT emp_no, MIN(salary) AS MIN_salary FROM salaries GROUP BY emp_no HAVING MIN(salary) < 40000;
## 6. 最終勤務日
従業員番号10001から10100の従業員のうち、勤務が終了している従業員の従業員番号と最後の勤務終了日を取得してください。なお勤務中の場合、勤務終了日は 9999-01-01 となります。
SELECT emp_no, MAX(to_date) AS end FROM salaries WHERE emp_no BETWEEN 10001 AND 10100 AND to_date < '9999-01-01' GROUP BY emp_no;

# テーブルを結合できる
## 1. 内部結合
部署マネージャーテーブルに、従業員テーブルのデータを内部結合させた全データを取得してください。
SELECT * FROM dept_manager INNER JOIN employees ON dept_manager.emp_no = employees.emp_no;
## 2. 列の選択
部署ごとに、部署番号、歴代のマネージャーの従業員番号、マネージャーのファーストネーム、マネージャーのラストネームを取得してください。
SELECT dept_manager.dept_no, dept_manager.emp_no, employees.first_name, employees.last_name
FROM dept_manager
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no
ORDER BY dept_manager.dept_no;
## 3. 複数の内部結合
部署ごとに、部署番号、部署名、歴代のマネージャーの従業員番号、マネージャーのファーストネーム、マネージャーのラストネームを取得してください。
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;
## 4. 絞り込み
部署ごとに、部署番号、部署名、現在のマネージャーの従業員番号、マネージャーのファーストネーム、マネージャーのラストネームを取得してください。
SELECT dept_manager.dept_no, departments.dept_name, current_dept_emp.emp_no, employees.first_name, employees.last_name
FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no
INNER JOIN current_dept_emp ON dept_manager.emp_no = current_dept_emp.emp_no
WHERE current_dept_emp.to_date = '9999-01-01'
## 5. 給与
従業員番号10001から10010の従業員ごとに、ファーストネーム、ラストネーム、いつからいつまで給与がいくらだったかを取得してください。
SELECT employees.emp_no, employees.first_name, employees.last_name, MIN(salaries.from_date) AS from_date, MAX(salaries.to_date) AS to_date, SUM(salaries.salary) AS total_salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE employees.emp_no BETWEEN '10001' AND '10010'
GROUP BY employees.emp_no;
## 6. 内部結合と外部結合の違い
INNER JOIN と OUTER JOIN の違いについて、SQL 初心者にわかるように説明してください。またどのように使い分けるのかも合わせて説明してください。
内部結合は結合するテーブルの異なるデータは表示せず、外部結合は異なるデータでも全てを表示します。
外部結合の全てというのはどちらのテーブルかのみ全て表示など指定できるので、一方のテーブルのデータは全て表示しておきたい場合に使います。
またデータが入らない箇所にはNULL値が含まれる場合にも使用される。