-- COUNT로 감싸고 그 안에 DISTINCT를 넣어서 NULL값과 중복값 모두 제거
SELECT COUNT(DISTINCT NAME)
FROM ANIMAL_INS;
