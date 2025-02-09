Q1
--部署(departments)テーブルを作成--
CREATE TABLE departments (
    department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);



Q2
--peopleテーブルに新しいカラム(department_id)を追加--
ALTER TABLE people ADD COLUMN department_id INT UNSIGNED AFTER email;



Q3
--departmentsにレコード追加--
INSERT INTO departments (name)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

--peopleにレコード追加--
INSERT INTO people (name, department_id)
VALUES
('山内', 1),
('前田', 1),
('内川', 1),
('中西', 2),
('早川', 2),
('竹内', 2),
('相葉', 2),
('前澤', 3),
('埼玉', 4),
('藤岡', 5);

--reportsにレコード追加--
INSERT INTO reports (person_id, content)
VALUES
(7, '開発の進捗状況について'),
(8, '朝ご飯の献立表報告書'),
(9, '課題進捗についての報告書'),
(10, '昼ごはんについてのお知らせ'),
(11, '開発スケジュールの調整'),
(12, '新規プロジェクトについて'),
(13, '夜ご飯の献立一部変更'),
(14, '経理部門の年度予算案'),
(15, '人事部門の採用状況報告について'),
(16, '情報システムの新規導入報告');



Q4
--department_idがNULLのレコードを1に更新--
UPDATE people SET department_id = 1 WHERE department_id IS NULL;



Q5
--年齢の降順で男性の名前と年齢を取得--
SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;



Q6
--SQL文の説明--
SELECT
  `name`, `email`, `age`
name,email,ageの3つのカラムのみを取得する

FROM
  `people`
peopleテーブルからデータを取得する

WHERE
  `department_id` = 1
department_idの値が1になっているレコードのみ選択

ORDER BY
  `created_at`;
取得したレコードをcreated_atの昇順で並べる
ASCやDESCを省略するとASCto同じ昇順になる



Q7
--20代の女性と40代の男性の名前を取得--
SELECT name FROM people WHERE (gender = '2' AND age BETWEEN 20 AND 29) OR (gender = '1' AND age BETWEEN 40 AND 49);



Q8
--営業部に所属する人だけを年齢の昇順で取得--
SELECT * FROM people WHERE department_id = 1 ORDER BY age;



Q9
--開発部に所属している女性の平均年齢を取得--
SELECT AVG(age) AS average_age FROM people WHERE department_id = 2 AND gender = 1;



Q10
--名前と部署名とその人が提出した日報の内容を同時に取得（日報を提出していない人は含めない）--
SELECT p.name, d.name, r.content FROM people p INNER JOIN reports r USING (person_id) INNER JOIN departments d USING (department_id);



Q11
--日報を一つも提出していない人の名前一覧を取得--
SELECT p.name FROM people p LEFT JOIN reports r USING (person_id) WHERE r.content IS NULL;