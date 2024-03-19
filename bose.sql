DROP TABLE BOSE_MEMBER;
DROP TABLE BOSE_CATEGORY;
DROP TABLE BOSE_BOARD;

DROP SEQUENCE BOSE_CATEGORY_SEQ;
DROP SEQUENCE BOSE_BOARD_SEQ;

--회원 테이블 (로그인 + 회원가입)
CREATE TABLE BOSE_MEMBER(
	  ID			VARCHAR2(100)		PRIMARY KEY		-- 아이디
	, PASSWORD		VARCHAR2(100)		NOT NULL			-- 비밀번호
	, NAME			VARCHAR2(100)		NOT NULL			-- 이름
	, BIRTH			VARCHAR2(8)		NOT NULL			-- 생년월일 8자리
	, GENDER		CHAR(1)				NOT NULL CHECK(GENDER IN('F', 'M'))
	, PHONE			VARCHAR2(11)		NOT NULL			-- 휴대폰번호 11자리 '-' 없이
);

INSERT INTO BOSE_MEMBER VALUES('test', '1111', '테스터', '19901210', 'F', '01012345678');

SELECT * FROM BOSE_MEMBER;

-- 카테고리 테이블
CREATE TABLE BOSE_CATEGORY(
	  CATE_NO 		NUMBER 				PRIMARY KEY
	, CATE_NAME 	VARCHAR2(100)		NOT NULL
);

CREATE SEQUENCE BOSE_CATEGORY_SEQ INCREMENT BY 1 START WITH 1;

INSERT INTO BOSE_CATEGORY VALUES(BOSE_CATEGORY_SEQ.NEXTVAL, '전체');
INSERT INTO BOSE_CATEGORY VALUES(BOSE_CATEGORY_SEQ.NEXTVAL, '주문/결제');
INSERT INTO BOSE_CATEGORY VALUES(BOSE_CATEGORY_SEQ.NEXTVAL, '출고/배송');
INSERT INTO BOSE_CATEGORY VALUES(BOSE_CATEGORY_SEQ.NEXTVAL, '교환/반품');
INSERT INTO BOSE_CATEGORY VALUES(BOSE_CATEGORY_SEQ.NEXTVAL, '서비스');
INSERT INTO BOSE_CATEGORY VALUES(BOSE_CATEGORY_SEQ.NEXTVAL, '기타');

SELECT * FROM BOSE_CATEGORY;

UPDATE BOSE_CATEGORY SET CATE_NAME = '전체' WHERE CATE_NO = 1;

--게시판
CREATE TABLE BOSE_BOARD(
	  SEQ			NUMBER 				PRIMARY KEY		-- 글번호 키
	, TITLE			VARCHAR2(300)		NOT NULL			-- 제목
	, WRITER 		VARCHAR2(100)		NOT NULL			-- 작성자 (회원테이블의 이름 사용)
	, REG_DATE 		DATE 				DEFAULT SYSDATE	-- 작성일
	, PASSWORD 		VARCHAR2(100)							-- 비밀여부 및 수정삭제 용도
	, CONTENT 		VARCHAR2(2000)							-- 내용
	, USERTYPE		VARCHAR2(20)		DEFAULT 'USER'		-- 관리자 여부
	, ID 			VARCHAR2(100) 		NOT NULL REFERENCES BOSE_MEMBER(ID) 			-- 회원아이디 (본인글 확인용도) FK
	, CATE_NO		NUMBER				NOT NULL REFERENCES BOSE_CATEGORY(CATE_NO) 	-- 카테고리 참조키
);

CREATE SEQUENCE BOSE_BOARD_SEQ INCREMENT BY 1 START WITH 1;


SELECT * FROM BOSE_BOARD ORDER BY SEQ DESC;


SELECT * FROM (
				SELECT ROWNUM R, A.* FROM (
											SELECT B.*, C.CATE_NAME FROM BOSE_BOARD B, BOSE_CATEGORY C WHERE B.CATE_NO = C.CATE_NO AND C.CATE_NO = 3 ORDER BY SEQ DESC
											) A
				)
WHERE R BETWEEN 1 AND 10 
;











SELECT * FROM bose_board WHERE CATE_NO = 5;

COMMIT;





--댓글 게시판
CREATE TABLE BOSE_REPLY(
	  RE_NO			NUMBER 				PRIMARY KEY		-- 댓글번호 키
	, SEQ 			NUMBER				FOREIGN KEY(NO) REFERENCES BOSE_BOARD(NO) -- 게시판 테이블의 글번호 (조인용도) FK 
	, WRITER 		VARCHAR2(100)		NOT NULL			-- 댓글 작성자 (회원테이블의 이름 사용)
	, REG_DATE 		DATE 				DEFAULT SYSDATE	-- 댓글 작성일
	, ID 			VARCHAR2(100) 		FOREIGN KEY(ID) REFERENCES BOSE_MEMBER(ID) -- 회원아이디 (본인글 확인용도) FK
	, PASSWORD 		VARCHAR2(100)							-- 비밀여부 및 수정삭제 용도
	, CONTENT 		VARCHAR2(2000)							-- 댓글내용
);





INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO) VALUES(BOSE_BOARD_SEQ.NEXTVAL, '헤드폰/이어버드의 베터리 교체가 가능한가요?', '테스터', '초소형 부품이 사용되는 헤드폰/이어버드 수리 및 배터리 교체가 불가능한 상품군으로, 보스 공식서비스 센터 [02-3446-3314] 를 통해서 새 제품 교체 방식으로 A/S 가 진행됩니다.', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO) VALUES(BOSE_BOARD_SEQ.NEXTVAL, '색상을 변경해서 보내주세요.', '테스터', '초소형 부품이 사용되는 헤드폰/이어버드 수리 및 배터리 교체가 불가능한 상품군으로, 보스 공식서비스 센터 [02-3446-3314] 를 통해서 새 제품 교체 방식으로 A/S 가 진행됩니다.', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 누수 현상이 있습니다.', '사용자1', '사용자1님의 이어폰 사용 중에 누수 현상이 발생했습니다. 어떻게 대처해야 할까요?', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 끊김 현상', '사용자2', '사용자2님의 이어폰 사용 중에 가끔씩 소리가 끊기는 현상이 발생합니다. 이를 개선할 수 있는 방법이 있을까요?', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '무선 이어폰 충전 문제', '사용자3', '사용자3님의 무선 이어폰을 충전하려고 하는데 충전이 되지 않습니다. 어떻게 해결해야 할까요?', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '헤드폰 왼쪽이 안 들려요', '사용자4', '사용자4님의 헤드폰을 사용 중인데 왼쪽이 소리가 안 들려요. 어떻게 해결해야 할까요?', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '헤드폰 사용 시 머리가 아프다', '사용자5', '사용자5님의 헤드폰을 사용하면 머리가 아파지는 현상이 있습니다. 어떻게 대처해야 할까요?', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 착용 후 귀가 아파요', '사용자6', '사용자6님의 이어폰을 착용한 후 귀가 아픈 느낌이 듭니다. 이에 대한 대처 방법이 있을까요?', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 세탁했는데 작동하지 않아요', '사용자7', '사용자7님의 이어폰을 세탁했더니 작동하지 않습니다. 이럴 때 어떻게 해결해야 하나요?', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 버튼이 동작하지 않아요', '사용자8', '사용자8님의 이어폰의 버튼이 제대로 동작하지 않습니다. 어떻게 해결해야 하나요?', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 얼마나 사용해야 하나요?', '사용자9', '사용자9님의 새로 구매한 이어폰을 얼마나 자주 사용해야 하나요? 최적의 사용 주기가 있을까요?', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 배터리가 너무 빨리 소모돼요', '사용자10', '사용자10님의 이어폰의 배터리가 너무 빨리 소모됩니다. 이에 대한 원인과 해결 방법을 알려주세요.', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 켜면 잡음이 들려요', '사용자11', '사용자11님의 이어폰을 켜면 특정 잡음이 들립니다. 이 문제에 대해 해결 방법을 알고 싶습니다.', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 배터리가 급격히 감소해요', '사용자12', '사용자12님의 이어폰을 사용 중에 배터리가 급격히 감소하는 현상이 발생합니다. 이에 대한 대처 방법을 알고 싶습니다.', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 이어팁 크기 조정 가능 여부', '사용자13', '사용자13님의 이어폰의 이어팁 크기를 조정할 수 있는지 궁금합니다. 어떤 이어폰은 크기 조정이 가능한가요?', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 블루투스 연결이 불안정해요', '사용자14', '사용자14님의 이어폰의 블루투스 연결이 가끔씩 불안정합니다. 이에 대한 원인과 해결 방법을 알고 싶습니다.', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 블루투스 연결 속도가 느려요', '사용자15', '사용자15님의 이어폰을 블루투스로 연결할 때 속도가 느린 경우가 있습니다. 이에 대한 대처 방법을 알고 싶습니다.', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 시 귓속이 따가워요', '사용자16', '사용자16님의 이어폰을 사용하면 귓속이 따가워지는 현상이 발생합니다. 이에 대한 대처 방법을 알고 싶습니다.', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '헤드폰 사용 중에 귀가 아파요', '사용자17', '헤드폰을 사용한 후 귀가 아파지는 현상이 있습니다. 어떻게 대처해야 할까요?', 'test', 2);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '헤드폰이 매우 무겁습니다', '사용자18', '헤드폰이 매우 무거워서 오래 착용하기 어렵습니다. 이 문제를 해결할 방법이 있을까요?', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 배터리가 너무 빨리 소모돼요', '사용자19', '사용자19님의 이어폰의 배터리가 너무 빨리 소모됩니다. 이에 대한 원인과 해결 방법을 알려주세요.', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 켜면 잡음이 들려요', '사용자20', '사용자20님의 이어폰을 켜면 특정 잡음이 들립니다. 이 문제에 대해 해결 방법을 알고 싶습니다.', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 배터리가 급격히 감소해요', '사용자21', '사용자21님의 이어폰을 사용 중에 배터리가 급격히 감소하는 현상이 발생합니다. 이에 대한 대처 방법을 알고 싶습니다.', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 이어팁 크기 조정 가능 여부', '사용자22', '사용자22님의 이어폰의 이어팁 크기를 조정할 수 있는지 궁금합니다. 어떤 이어폰은 크기 조정이 가능한가요?', 'test', 2);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 블루투스 연결이 불안정해요', '사용자23', '사용자23님의 이어폰의 블루투스 연결이 가끔씩 불안정합니다. 이에 대한 원인과 해결 방법을 알고 싶습니다.', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 블루투스 연결 속도가 느려요', '사용자24', '사용자24님의 이어폰을 블루투스로 연결할 때 속도가 느린 경우가 있습니다. 이에 대한 대처 방법을 알고 싶습니다.', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 시 귓속이 따가워요', '사용자25', '사용자25님의 이어폰을 사용하면 귓속이 따가워지는 현상이 발생합니다. 이에 대한 대처 방법을 알고 싶습니다.', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '헤드폰의 이어캡 교체 가능 여부', '사용자26', '헤드폰의 이어캡을 교체할 수 있는지 궁금합니다. 교체가 가능한 모델이 있을까요?', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 귀가 따가워요', '사용자27', '사용자27님의 이어폰 사용 중에 귀가 따가워지는 문제가 있습니다. 이 문제를 해결할 수 있는 방법이 있을까요?', 'test', 2);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 착용 후 귀가 따가워요', '사용자28', '사용자28님의 이어폰을 착용한 후 귀가 따가워지는 문제가 있습니다. 이에 대한 대처 방법을 알려주세요.', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 세탁했는데 작동하지 않아요', '사용자29', '사용자29님의 이어폰을 세탁했더니 작동하지 않습니다. 이럴 때 어떻게 해결해야 하나요?', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 버튼이 동작하지 않아요', '사용자30', '사용자30님의 이어폰의 버튼이 제대로 동작하지 않습니다. 어떻게 해결해야 하나요?', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 얼마나 사용해야 하나요?', '사용자31', '사용자31님의 새로 구매한 이어폰을 얼마나 자주 사용해야 하나요? 최적의 사용 주기가 있을까요?', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 배터리가 너무 빨리 소모돼요', '사용자32', '사용자32님의 이어폰의 배터리가 너무 빨리 소모됩니다. 이에 대한 원인과 해결 방법을 알려주세요.', 'test', 2);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 켜면 잡음이 들려요', '사용자33', '사용자33님의 이어폰을 켜면 특정 잡음이 들립니다. 이 문제에 대해 해결 방법을 알고 싶습니다.', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 배터리가 급격히 감소해요', '사용자34', '사용자34님의 이어폰을 사용 중에 배터리가 급격히 감소하는 현상이 발생합니다. 이에 대한 대처 방법을 알고 싶습니다.', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 이어팁 크기 조정 가능 여부', '사용자35', '사용자35님의 이어폰의 이어팁 크기를 조정할 수 있는지 궁금합니다. 어떤 이어폰은 크기 조정이 가능한가요?', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 블루투스 연결이 불안정해요', '사용자36', '사용자36님의 이어폰의 블루투스 연결이 가끔씩 불안정합니다. 이에 대한 원인과 해결 방법을 알고 싶습니다.', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 블루투스 연결 속도가 느려요', '사용자37', '사용자37님의 이어폰을 블루투스로 연결할 때 속도가 느린 경우가 있습니다. 이에 대한 대처 방법을 알고 싶습니다.', 'test', 2);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 시 귓속이 따가워요', '사용자38', '사용자38님의 이어폰을 사용하면 귓속이 따가워지는 현상이 발생합니다. 이에 대한 대처 방법을 알고 싶습니다.', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 배터리가 급격히 감소해요', '사용자39', '사용자39님의 이어폰을 사용 중에 배터리가 급격히 감소하는 현상이 발생합니다. 이에 대한 대처 방법을 알고 싶습니다.', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 이어팁 크기 조정 가능 여부', '사용자40', '사용자40님의 이어폰의 이어팁 크기를 조정할 수 있는지 궁금합니다. 어떤 이어폰은 크기 조정이 가능한가요?', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 블루투스 연결이 불안정해요', '사용자41', '사용자41님의 이어폰의 블루투스 연결이 가끔씩 불안정합니다. 이에 대한 원인과 해결 방법을 알고 싶습니다.', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 시 배터리가 급격히 감소돼요', '사용자42', '사용자42님의 이어폰을 사용하는 도중에 배터리가 급격히 감소합니다. 이 문제를 해결할 방법이 있을까요?', 'test', 2);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 소음이 들려요', '사용자43', '사용자43님의 이어폰 사용 중에 소음이 들립니다. 이에 대한 대처 방법이 있을까요?', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 사용하면 귀가 아파요', '사용자44', '사용자44님의 이어폰을 사용하면 귀가 아픈 느낌이 듭니다. 이에 대한 대처 방법이 있을까요?', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 착용 후 귀가 따가워져요', '사용자45', '사용자45님의 이어폰을 착용한 후 귀가 따가워지는 문제가 발생합니다. 어떻게 해결해야 할까요?', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 세탁했는데 작동하지 않아요', '사용자46', '사용자46님의 이어폰을 세탁했더니 작동하지 않습니다. 이럴 때 어떻게 해결해야 하나요?', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 버튼이 동작하지 않아요', '사용자47', '사용자47님의 이어폰의 버튼이 동작하지 않습니다. 어떻게 해결해야 하나요?', 'test', 2);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 얼마나 사용해야 하나요?', '사용자48', '사용자48님의 새로 구매한 이어폰을 얼마나 자주 사용해야 하나요? 최적의 사용 주기가 있을까요?', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 배터리가 너무 빨리 소모돼요', '사용자49', '사용자49님의 이어폰의 배터리가 너무 빨리 소모됩니다. 이에 대한 원인과 해결 방법을 알려주세요.', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 켜면 잡음이 들려요', '사용자50', '사용자50님의 이어폰을 켜면 특정 잡음이 들립니다. 이 문제에 대해 해결 방법을 알고 싶습니다.', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 배터리가 급격히 감소해요', '사용자51', '사용자51님의 이어폰을 사용 중에 배터리가 급격히 감소하는 현상이 발생합니다. 이에 대한 대처 방법을 알고 싶습니다.', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 이어팁 크기 조정 가능 여부', '사용자52', '사용자52님의 이어폰의 이어팁 크기를 조정할 수 있는지 궁금합니다. 어떤 이어폰은 크기 조정이 가능한가요?', 'test', 2);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 블루투스 연결이 불안정해요', '사용자53', '사용자53님의 이어폰의 블루투스 연결이 가끔씩 불안정합니다. 이에 대한 원인과 해결 방법을 알고 싶습니다.', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 시 귓속이 따가워요', '사용자54', '사용자54님의 이어폰을 사용하면 귓속이 따가워지는 현상이 발생합니다. 이에 대한 대처 방법을 알고 싶습니다.', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 소음이 들려요', '사용자55', '사용자55님의 이어폰 사용 중에 소음이 들립니다. 이에 대한 대처 방법이 있을까요?', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 사용하면 귀가 아파요', '사용자56', '사용자56님의 이어폰을 사용하면 귀가 아픈 느낌이 듭니다. 이에 대한 대처 방법이 있을까요?', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 착용 후 귀가 따가워져요', '사용자57', '사용자57님의 이어폰을 착용한 후 귀가 따가워지는 문제가 발생합니다. 어떻게 해결해야 할까요?', 'test', 2);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 세탁했는데 작동하지 않아요', '사용자58', '사용자58님의 이어폰을 세탁했더니 작동하지 않습니다. 이럴 때 어떻게 해결해야 하나요?', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 버튼이 동작하지 않아요', '사용자59', '사용자59님의 이어폰의 버튼이 동작하지 않습니다. 어떻게 해결해야 하나요?', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 얼마나 사용해야 하나요?', '사용자60', '사용자60님의 새로 구매한 이어폰을 얼마나 자주 사용해야 하나요? 최적의 사용 주기가 있을까요?', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 배터리가 너무 빨리 소모돼요', '사용자61', '사용자61님의 이어폰의 배터리가 너무 빨리 소모됩니다. 이에 대한 원인과 해결 방법을 알려주세요.', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 배터리가 급격히 감소해요', '사용자63', '사용자63님의 이어폰을 사용 중에 배터리가 급격히 감소하는 현상이 발생합니다. 이에 대한 대처 방법을 알고 싶습니다.', 'test', 2);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 이어팁 크기 조정 가능 여부', '사용자64', '사용자64님의 이어폰의 이어팁 크기를 조정할 수 있는지 궁금합니다. 어떤 이어폰은 크기 조정이 가능한가요?', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 블루투스 연결이 불안정해요', '사용자65', '사용자65님의 이어폰의 블루투스 연결이 가끔씩 불안정합니다. 이에 대한 원인과 해결 방법을 알고 싶습니다.', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 시 귓속이 따가워요', '사용자66', '사용자66님의 이어폰을 사용하면 귓속이 따가워지는 현상이 발생합니다. 이에 대한 대처 방법을 알고 싶습니다.', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 소음이 들려요', '사용자67', '사용자67님의 이어폰 사용 중에 소음이 들립니다. 이에 대한 대처 방법이 있을까요?', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 사용하면 귀가 아파요', '사용자68', '사용자68님의 이어폰을 사용하면 귀가 아픈 느낌이 듭니다. 이에 대한 대처 방법이 있을까요?', 'test', 2);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 착용 후 귀가 따가워져요', '사용자69', '사용자69님의 이어폰을 착용한 후 귀가 따가워지는 문제가 발생합니다. 어떻게 해결해야 할까요?', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 세탁했는데 작동하지 않아요', '사용자70', '사용자70님의 이어폰을 세탁했더니 작동하지 않습니다. 이럴 때 어떻게 해결해야 하나요?', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 버튼이 동작하지 않아요', '사용자71', '사용자71님의 이어폰의 버튼이 동작하지 않습니다. 어떻게 해결해야 하나요?', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 얼마나 사용해야 하나요?', '사용자72', '사용자72님의 새로 구매한 이어폰을 얼마나 자주 사용해야 하나요? 최적의 사용 주기가 있을까요?', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 배터리가 너무 빨리 소모돼요', '사용자73', '사용자73님의 이어폰의 배터리가 너무 빨리 소모됩니다. 이에 대한 원인과 해결 방법을 알려주세요.', 'test', 2);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 켜면 잡음이 들려요', '사용자74', '사용자74님의 이어폰을 켜면 특정 잡음이 들립니다. 이 문제에 대해 해결 방법을 알고 싶습니다.', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 배터리가 급격히 감소해요', '사용자75', '사용자75님의 이어폰을 사용 중에 배터리가 급격히 감소하는 현상이 발생합니다. 이에 대한 대처 방법을 알고 싶습니다.', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 이어팁 크기 조정 가능 여부', '사용자76', '사용자76님의 이어폰의 이어팁 크기를 조정할 수 있는지 궁금합니다. 어떤 이어폰은 크기 조정이 가능한가요?', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 블루투스 연결이 불안정해요', '사용자77', '사용자77님의 이어폰의 블루투스 연결이 가끔씩 불안정합니다. 이에 대한 원인과 해결 방법을 알고 싶습니다.', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 시 귓속이 따가워요', '사용자78', '사용자78님의 이어폰을 사용하면 귓속이 따가워지는 현상이 발생합니다. 이에 대한 대처 방법을 알고 싶습니다.', 'test', 2);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 소음이 들려요', '사용자79', '사용자79님의 이어폰 사용 중에 소음이 들립니다. 이에 대한 대처 방법이 있을까요?', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 사용하면 귀가 아파요', '사용자80', '사용자80님의 이어폰을 사용하면 귀가 아픈 느낌이 듭니다. 이에 대한 대처 방법이 있을까요?', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 착용 후 귀가 따가워져요', '사용자81', '사용자81님의 이어폰을 착용한 후 귀가 따가워지는 문제가 발생합니다. 어떻게 해결해야 할까요?', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 세탁했는데 작동하지 않아요', '사용자82', '사용자82님의 이어폰을 세탁했더니 작동하지 않습니다. 이럴 때 어떻게 해결해야 하나요?', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 버튼이 동작하지 않아요', '사용자83', '사용자83님의 이어폰의 버튼이 동작하지 않습니다. 어떻게 해결해야 하나요?', 'test', 2);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 얼마나 사용해야 하나요?', '사용자84', '사용자84님의 새로 구매한 이어폰을 얼마나 자주 사용해야 하나요? 최적의 사용 주기가 있을까요?', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 배터리가 너무 빨리 소모돼요', '사용자85', '사용자85님의 이어폰의 배터리가 너무 빨리 소모됩니다. 이에 대한 원인과 해결 방법을 알려주세요.', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 켜면 잡음이 들려요', '사용자86', '사용자86님의 이어폰을 켜면 특정 잡음이 들립니다. 이 문제에 대해 해결 방법을 알고 싶습니다.', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 배터리가 급격히 감소해요', '사용자87', '사용자87님의 이어폰을 사용 중에 배터리가 급격히 감소하는 현상이 발생합니다. 이에 대한 대처 방법을 알고 싶습니다.', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 이어팁 크기 조정 가능 여부', '사용자88', '사용자88님의 이어폰의 이어팁 크기를 조정할 수 있는지 궁금합니다. 어떤 이어폰은 크기 조정이 가능한가요?', 'test', 2);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 블루투스 연결이 가끔씩 끊겨요', '사용자89', '사용자89님의 이어폰의 블루투스 연결이 가끔씩 끊기는 문제가 발생합니다. 이에 대한 대처 방법을 알고 싶습니다.', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 불편한 점이 있어요', '사용자90', '사용자90님은 이어폰 사용 중에 불편한 점을 느낍니다. 무엇이 문제일까요?', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 착용하면 이명이 들려요', '사용자91', '사용자91님은 이어폰을 착용하면 이명이 들리는 문제를 겪고 있습니다. 이에 대한 해결 방법을 알려주세요.', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 배터리가 빨리 닳아요', '사용자92', '사용자92님은 이어폰 사용 중에 배터리가 빨리 닳는 문제를 겪고 있습니다. 해결 방법을 알려주세요.', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰이 제대로 충전되지 않아요', '사용자93', '사용자93님은 이어폰이 제대로 충전되지 않는다고 합니다. 어떻게 해결할 수 있을까요?', 'test', 2);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 물에 젖게 되면 작동이 안 돼요', '사용자94', '사용자94님의 이어폰이 물에 젖게 되면 작동하지 않는다고 합니다. 이럴 때 어떻게 해결할 수 있을까요?', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 갑자기 꺼져요', '사용자95', '사용자95님의 이어폰이 사용 중에 갑자기 꺼지는 문제가 있습니다. 이에 대한 해결 방법이 있을까요?', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 사용 중에 발열이 심해요', '사용자96', '사용자96님의 이어폰을 사용 중에 발열이 심하게 일어납니다. 이 문제를 해결할 방법이 있을까요?', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 마이크가 작동하지 않아요', '사용자97', '사용자97님의 이어폰의 마이크가 작동하지 않습니다. 이 문제를 해결할 수 있는 방법이 있을까요?', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 배터리가 급격히 소모돼요', '사용자98', '사용자98님의 이어폰 사용 중에 배터리가 급격히 소모됩니다. 이에 대한 원인과 해결 방법을 알려주세요.', 'test', 2);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 이어팁이 계속 빠져요', '사용자99', '사용자99님의 이어폰의 이어팁이 계속 빠지는 문제가 있습니다. 이에 대한 대처 방법을 알고 싶습니다.', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 연결이 끊겨요', '사용자100', '사용자100님은 이어폰 사용 중에 연결이 끊기는 문제를 겪고 있습니다. 이 문제를 해결할 방법이 있을까요?', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 켜면 소리가 나지 않아요', '사용자101', '사용자101님은 이어폰을 켜도 소리가 나지 않는 문제를 겪고 있습니다. 이에 대한 대처 방법이 있을까요?', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 이명이 들려요', '사용자102', '사용자102님은 이어폰 사용 중에 이명이 들리는 문제를 겪고 있습니다. 어떻게 해결할 수 있을까요?', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 켜도 작동하지 않아요', '사용자103', '사용자103님은 이어폰을 켜도 작동하지 않는 문제를 겪고 있습니다. 이 문제를 해결할 방법이 있을까요?', 'test', 2);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 갑자기 꺼져요', '사용자104', '사용자104님의 이어폰이 사용 중에 갑자기 꺼지는 문제가 있습니다. 이에 대한 해결 방법이 있을까요?', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 사용하면 귀가 아파요', '사용자105', '사용자105님은 이어폰을 사용하면 귀가 아픈 느낌이 든다고 합니다. 이 문제를 해결할 방법이 있을까요?', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 착용 후 귀가 따가워져요', '사용자106', '사용자106님은 이어폰을 착용한 후 귀가 따가워지는 문제를 겪고 있습니다. 이에 대한 해결 방법이 있을까요?', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 세탁했는데 작동하지 않아요', '사용자107', '사용자107님은 이어폰을 세탁했더니 작동하지 않는다고 합니다. 이럴 때 어떻게 해결할 수 있을까요?', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 버튼이 동작하지 않아요', '사용자108', '사용자108님은 이어폰의 버튼이 동작하지 않는다고 합니다. 이 문제를 해결할 방법이 있을까요?', 'test', 2);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 얼마나 사용해야 하나요?', '사용자109', '사용자109님은 새로 구매한 이어폰을 얼마나 자주 사용해야 할지 궁금해합니다. 최적의 사용 주기가 있을까요?', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 배터리가 너무 빨리 소모돼요', '사용자110', '사용자110님은 이어폰의 배터리가 너무 빨리 소모된다고 합니다. 이에 대한 대처 방법을 알려주세요.', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 켜면 잡음이 들려요', '사용자111', '사용자111님은 이어폰을 켜면 잡음이 들린다고 합니다. 어떻게 해결할 수 있을까요?', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 배터리가 급격히 감소해요', '사용자112', '사용자112님은 이어폰 사용 중에 배터리가 급격히 감소한다고 합니다. 이에 대한 대처 방법을 알고 싶습니다.', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰의 이어팁 크기 조정 가능 여부', '사용자113', '사용자113님은 이어폰의 이어팁 크기를 조정할 수 있는지 궁금합니다. 어떤 이어폰은 크기 조정이 가능한가요?', 'test', 2);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 시 귓속이 따가워요', '사용자115', '사용자115님은 이어폰을 사용하면 귓속이 따가워진다고 합니다. 이럴 때 어떻게 해결할 수 있을까요?', 'test', 3);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 사용 중에 소음이 들려요', '사용자116', '사용자116님은 이어폰을 사용 중에 소음이 들린다고 합니다. 이에 대한 해결 방법을 알고 싶습니다.', 'test', 4);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 사용하면 귀가 아파요', '사용자117', '사용자117님은 이어폰을 사용하면 귀가 아픈 느낌이 든다고 합니다. 어떻게 해결할 수 있을까요?', 'test', 5);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰 착용 후 귀가 따가워져요', '사용자118', '사용자118님은 이어폰을 착용한 후 귀가 따가워진다고 합니다. 이 문제를 해결할 방법이 있을까요?', 'test', 6);
INSERT INTO BOSE_BOARD(SEQ, TITLE, WRITER, CONTENT, ID, CATE_NO)
VALUES
(BOSE_BOARD_SEQ.NEXTVAL, '이어폰을 세탁했는데 작동하지 않아요', '사용자119', '사용자119님은 이어폰을 세탁했더니 작동하지 않는다고 합니다. 이럴 때 어떻게 해결할 수 있을까요?', 'test', 2);
