/* 객체 생성 예)
[item]- itemName : 울트라 이어버드
        itemCode : String
        mType : "headphone(hp), earphone(ep), soundbar(sb), speaker(sp), reaper(rp)"
        dType : "type1, type2, accessory"
        price : Number
        colors : [] array
        sales : Number
        isNew : YN
        isBest : YN
        reviews : [{}, {}, ..] array
        imgs : [] array
        made : String
*/

// 전체 아이템을 관리할 배열
let items = [
  // ====================================================
  // 해드폰 (hp)
  // ====================================================
  {
      itemCode   : 'hp_type1_0001'
    , itemName   : '[BOSE] 보스 QC 울트라 헤드폰'
    , mType      : 'hp'
    , dType      : 'type1'
    , price      : 499000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'Y'
    , isBest     : 'Y'
    , reviews    : []
    , imgs       : ['hp_type1_img1.jpg', 'hp_type1_img1-1.jpg']
    , made       : '태국,중국'
  },
  {
      itemCode   : 'hp_type1_0002'
    , itemName   : '[BOSE] 보스 QC 헤드폰'
    , mType      : 'hp'
    , dType      : 'type1'
    , price      : 389000
    , colors     : ['#000', '#fff', '#104018']
    , sales      : 0
    , isNew      : 'Y'
    , isBest     : 'Y'
    , reviews    : []
    , imgs       : ['hp_type1_img2.jpg', 'hp_type1_img2-1.jpg']
    , made       : '태국'
  },
  {
      itemCode   : 'hp_type1_0003'
    , itemName   : '[BOSE] 보스 노이즈캔슬링 헤드폰 700'
    , mType      : 'hp'
    , dType      : 'type1'
    , price      : 499000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['hp_type1_img3.jpg', 'hp_type1_img3-1.jpg']
    , made       : '태국'
  },
  {
      itemCode   : 'hp_type1_0004'
    , itemName   : '[BOSE] 보스 노이즈캔슬링 헤드폰 700 UC'
    , mType      : 'hp'
    , dType      : 'type1'
    , price      : 660000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'Y'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['hp_type1_img4.jpg', 'hp_type1_img4-1.jpg']
    , made       : ''
  },
  {
      itemCode   : 'hp_type1_0005'
    , itemName   : '[BOSE] 보스 QC 울트라 헤드폰'
    , mType      : 'hp'
    , dType      : 'type1'
    , price      : 499000
    , colors     : ['#fff', '#000']
    , sales      : 399000
    , isNew      : 'N'
    , isBest     : 'Y'
    , reviews    : []
    , imgs       : ['hp_type1_img1-1.jpg', 'hp_type1_img1.jpg']
    , made       : '태국,중국'
  },
  {
      itemCode   : 'hp_type1_0006'
    , itemName   : '[BOSE] 보스 QC 헤드폰'
    , mType      : 'hp'
    , dType      : 'type1'
    , price      : 389000
    , colors     : ['#fff', '#000', '#104018']
    , sales      : 299000
    , isNew      : 'N'
    , isBest     : 'Y'
    , reviews    : []
    , imgs       : ['hp_type1_img2-1.jpg', 'hp_type1_img2.jpg']
    , made       : '태국'
  },
  {
      itemCode   : 'hp_type1_0007'
    , itemName   : '[BOSE] 보스 노이즈캔슬링 헤드폰 700'
    , mType      : 'hp'
    , dType      : 'type1'
    , price      : 499000
    , colors     : ['#fff', '#000']
    , sales      : 399000
    , isNew      : 'Y'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['hp_type1_img3-1.jpg', 'hp_type1_img3.jpg']
    , made       : '태국'
  },
  {
      itemCode   : 'hp_type1_0008'
    , itemName   : '[BOSE] 보스 노이즈캔슬링 헤드폰 700 UC'
    , mType      : 'hp'
    , dType      : 'type1'
    , price      : 660000
    , colors     : ['#fff', '#000']
    , sales      : 0
    , isNew      : 'Y'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['hp_type1_img4-1.jpg', 'hp_type1_img4.jpg']
    , made       : ''
  },
  {
      itemCode   : 'hp_type1_0009'
    , itemName   : '[BOSE] 보스 QC 울트라 헤드폰'
    , mType      : 'hp'
    , dType      : 'type1'
    , price      : 499000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'Y'
    , isBest     : 'Y'
    , reviews    : []
    , imgs       : ['hp_type1_img1.jpg', 'hp_type1_img1-1.jpg']
    , made       : '태국,중국'
  },
  {
      itemCode   : 'hp_type1_0010'
    , itemName   : '[BOSE] 보스 QC 헤드폰'
    , mType      : 'hp'
    , dType      : 'type1'
    , price      : 389000
    , colors     : ['#fff', '#000', '#104018']
    , sales      : 0
    , isNew      : 'Y'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['hp_type1_img2-1.jpg', 'hp_type1_img2.jpg']
    , made       : '태국'
  },
  {
      itemCode   : 'hp_type1_0011'
    , itemName   : '[BOSE] 보스 노이즈캔슬링 헤드폰 700'
    , mType      : 'hp'
    , dType      : 'type1'
    , price      : 499000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'Y'
    , reviews    : []
    , imgs       : ['hp_type1_img3.jpg', 'hp_type1_img3-1.jpg']
    , made       : '태국'
  },
  {
      itemCode   : 'hp_type1_0012'
    , itemName   : '[BOSE] 보스 노이즈캔슬링 헤드폰 700 UC'
    , mType      : 'hp'
    , dType      : 'type1'
    , price      : 660000
    , colors     : ['#fff', '#000']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['hp_type1_img4-1.jpg', 'hp_type1_img4.jpg']
    , made       : ''
  },


  // ====================================================
  // 이어폰 (ep)
  // ====================================================
  // ------------------- type1 -------------------
  {
      itemCode   : 'ep_type1_0001'
    , itemName   : '[BOSE] 보스 QC 울트라 이어버드'
    , mType      : 'ep'
    , dType      : 'type1'
    , price      : 359000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'Y'
    , isBest     : 'Y'
    , reviews    : []
    , imgs       : ['ep_type1_img1.jpg', 'ep_type1_img1-1.jpg']
    , made       : '중국'
  },
  {
      itemCode   : 'ep_type1_0002'
    , itemName   : '[BOSE] 보스 QC 이어버드 2 이어폰'
    , mType      : 'ep'
    , dType      : 'type1'
    , price      : 359000
    , colors     : ['#000', '#fff', '#0a1054', '#949292']
    , sales      : 0
    , isNew      : 'Y'
    , isBest     : 'Y'
    , reviews    : []
    , imgs       : ['ep_type1_img2.jpg', 'ep_type1_img2-1.jpg']
    , made       : '중국'
  },
  {
      itemCode   : 'ep_type1_0003'
    , itemName   : '[BOSE] 보스 QC 울트라 이어버드'
    , mType      : 'ep'
    , dType      : 'type1'
    , price      : 359000
    , colors     : ['#fff', '#000']
    , sales      : 0
    , isNew      : 'Y'
    , isBest     : 'Y'
    , reviews    : []
    , imgs       : ['ep_type1_img1-1.jpg', 'ep_type1_img1.jpg']
    , made       : '중국'
  },
  {
      itemCode   : 'ep_type1_0004'
    , itemName   : '[BOSE] 보스 QC 이어버드 2 이어폰'
    , mType      : 'ep'
    , dType      : 'type1'
    , price      : 359000
    , colors     : ['#fff', '#000', '#0a1054', '#949292']
    , sales      : 0
    , isNew      : 'Y'
    , isBest     : 'Y'
    , reviews    : []
    , imgs       : ['ep_type1_img2-1.jpg', 'ep_type1_img2.jpg']
    , made       : '중국'
  },
  // ------------------- acce -------------------
  {
      itemCode   : 'ep_acce_0001'
    , itemName   : '[BOSE] 보스 QC 이어버드 실리콘 커버 케이스'
    , mType      : 'ep'
    , dType      : 'acce'
    , price      : 29000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['ep_acce_img1.jpg', 'ep_acce_img1-1.jpg']
    , made       : '중국'
  },
  {
      itemCode   : 'ep_acce_0002'
    , itemName   : '[BOSE] 보스 QC 이어버드 패브릭 커버 케이스'
    , mType      : 'ep'
    , dType      : 'acce'
    , price      : 39000
    , colors     : ['#323132']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['ep_acce_img2.jpg']
    , made       : '대만'
  },
  {
      itemCode   : 'ep_acce_0003'
    , itemName   : '[BOSE] 보스 무선 충전 케이스 커버'
    , mType      : 'ep'
    , dType      : 'acce'
    , price      : 59000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['ep_acce_img3.jpg', 'ep_acce_img3-1.jpg']
    , made       : '베트남'
  },
  {
      itemCode   : 'ep_acce_0004'
    , itemName   : '[BOSE] 보스 QC 이어버드 2 충전 케이스'
    , mType      : 'ep'
    , dType      : 'acce'
    , price      : 130000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['ep_acce_img4.jpg', 'ep_acce_img4-1.jpg']
    , made       : '중국'
  },
  {
      itemCode   : 'ep_acce_0005'
    , itemName   : '[BOSE] 보스 QC 이어버드 실리콘 커버 케이스'
    , mType      : 'ep'
    , dType      : 'acce'
    , price      : 29000
    , colors     : ['#fff', '#000']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['ep_acce_img1-1.jpg', 'ep_acce_img1.jpg']
    , made       : '중국'
  },
  {
      itemCode   : 'ep_acce_0006'
    , itemName   : '[BOSE] 보스 QC 이어버드 패브릭 커버 케이스'
    , mType      : 'ep'
    , dType      : 'acce'
    , price      : 39000
    , colors     : ['#323132']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['ep_acce_img2.jpg']
    , made       : '대만'
  },
  {
      itemCode   : 'ep_acce_0007'
    , itemName   : '[BOSE] 보스 무선 충전 케이스 커버'
    , mType      : 'ep'
    , dType      : 'acce'
    , price      : 59000
    , colors     : ['#fff', '#000']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['ep_acce_img3-1.jpg', 'ep_acce_img3.jpg']
    , made       : '베트남'
  },
  {
      itemCode   : 'ep_acce_0008'
    , itemName   : '[BOSE] 보스 QC 이어버드 2 충전 케이스'
    , mType      : 'ep'
    , dType      : 'acce'
    , price      : 130000
    , colors     : ['#fff', '#000']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['ep_acce_img4-1.jpg', 'ep_acce_img4.jpg']
    , made       : '중국'
  },

  
  // ====================================================
  // 사운드바 (sb)
  // ====================================================
  // ------------------- type1 -------------------
  {
      itemCode   : 'sb_type1_0001'
    , itemName   : '[BOSE] 보스 뮤직 앰프'
    , mType      : 'sb'
    , dType      : 'type1'
    , price      : 890000
    , colors     : ['#000']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sb_type1_img1.jpg']
    , made       : '태국'
  },
  {
      itemCode   : 'sb_type1_0002'
    , itemName   : '[BOSE] 보스 스마트 사운드바 600'
    , mType      : 'sb'
    , dType      : 'type1'
    , price      : 699000
    , colors     : ['#000']
    , sales      : 0
    , isNew      : 'Y'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sb_type1_img2.jpg']
    , made       : '말레이시아'
  },
  {
      itemCode   : 'sb_type1_0003'
    , itemName   : '[BOSE] 보스 스마트 사운드바 900'
    , mType      : 'sb'
    , dType      : 'type1'
    , price      : 1199000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'Y'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sb_type1_img3.jpg', 'sb_type1_img3-1.jpg']
    , made       : ''
  },
  {
      itemCode   : 'sb_type1_0004'
    , itemName   : '[BOSE] 보스 사운드바 300'
    , mType      : 'sb'
    , dType      : 'type1'
    , price      : 599000
    , colors     : ['#000']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sb_type1_img4.jpg']
    , made       : ''
  },
  {
      itemCode   : 'sb_type1_0005'
    , itemName   : '[BOSE] 보스 스마트 사운드바 900'
    , mType      : 'sb'
    , dType      : 'type1'
    , price      : 1199000
    , colors     : ['#fff', '#000']
    , sales      : 0
    , isNew      : 'Y'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sb_type1_img3-1.jpg', 'sb_type1_img3.jpg']
    , made       : ''
  },
  // ------------------- type2 -------------------
  {
      itemCode   : 'sb_type2_0001'
    , itemName   : '[BOSE] 보스 사운드바 900 + 베이스 모듈 700 + 서라운드 스피커 700 세트'
    , mType      : 'sb'
    , dType      : 'type2'
    , price      : 2717000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sb_type2_img1.jpg', 'sb_type2_img1-1.jpg']
    , made       : ''
  },
  {
      itemCode   : 'sb_type2_0002'
    , itemName   : '[BOSE] 보스 사운드바 900 + 베이스 모듈 700 세트'
    , mType      : 'sb'
    , dType      : 'type2'
    , price      : 2038000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sb_type2_img2.jpg', 'sb_type2_img2-1.jpg']
    , made       : ''
  },
  {
      itemCode   : 'sb_type2_0003'
    , itemName   : '[BOSE] 보스 사운드바 900 + 베이스 모듈 700 + 서라운드 스피커 세트'
    , mType      : 'sb'
    , dType      : 'type2'
    , price      : 2428000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'Y'
    , reviews    : []
    , imgs       : ['sb_type2_img3.jpg', 'sb_type2_img3-1.jpg']
    , made       : ''
  },
  {
      itemCode   : 'sb_type2_0004'
    , itemName   : '[BOSE] 보스 사운드바300 + 베이스 모듈 500 세트'
    , mType      : 'sb'
    , dType      : 'type2'
    , price      : 1148000
    , colors     : ['#000']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sb_type2_img4.jpg']
    , made       : ''
  },
  {
    itemCode   : 'sb_type2_0005'
    , itemName   : '[BOSE] 보스 사운드바 900 + 베이스 모듈 700 + 서라운드 스피커 700 세트'
    , mType      : 'sb'
    , dType      : 'type2'
    , price      : 2717000
    , colors     : ['#fff', '#000']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sb_type2_img1-1.jpg', 'sb_type2_img1.jpg']
    , made       : ''
  },
  {
      itemCode   : 'sb_type2_0006'
    , itemName   : '[BOSE] 보스 사운드바 900 + 베이스 모듈 700 세트'
    , mType      : 'sb'
    , dType      : 'type2'
    , price      : 2038000
    , colors     : ['#fff', '#000']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sb_type2_img2-1.jpg', 'sb_type2_img2.jpg']
    , made       : ''
  },
  {
      itemCode   : 'sb_type2_0007'
    , itemName   : '[BOSE] 보스 사운드바 900 + 베이스 모듈 700 + 서라운드 스피커 세트'
    , mType      : 'sb'
    , dType      : 'type2'
    , price      : 2428000
    , colors     : ['#fff', '#000']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'Y'
    , reviews    : []
    , imgs       : ['sb_type2_img3-1.jpg', 'sb_type2_img3.jpg']
    , made       : ''
  },
  // ------------------- acce -------------------
  {
      itemCode   : 'sb_acce_0001'
    , itemName   : '[BOSE] 보스 사운드바 월브라켓'
    , mType      : 'sb'
    , dType      : 'acce'
    , price      : 55000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sb_acce_img1.jpg', 'sb_acce_img1-1.jpg']
    , made       : '중국'
  },
  {
      itemCode   : 'sb_acce_0002'
    , itemName   : '[BOSE] 보스 서라운드 실링(천장) 브라켓 UB-20'
    , mType      : 'sb'
    , dType      : 'acce'
    , price      : 44000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sb_acce_img2.jpg', 'sb_acce_img2-1.jpg']
    , made       : '중국'
  },
  {
      itemCode   : 'sb_acce_0003'
    , itemName   : '[BOSE] 보스 서라운드 플로어 스탠드 UFS-20 II'
    , mType      : 'sb'
    , dType      : 'acce'
    , price      : 143000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sb_acce_img3.jpg', 'sb_acce_img3-1.jpg']
    , made       : '중국'
  },
  {
      itemCode   : 'sb_acce_0004'
    , itemName   : '[BOSE] 보스 옴니 주얼 월 브라켓 (서라운드 스피커 700 전용)'
    , mType      : 'sb'
    , dType      : 'acce'
    , price      : 66000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sb_acce_img4.jpg', 'sb_acce_img4-1.jpg']
    , made       : '중국'
  },

  
  // ====================================================
  // 스피커 (sp)
  // ====================================================
  // ------------------- type1 -------------------
  {
      itemCode   : 'sp_type1_0001'
    , itemName   : '[BOSE] 보스 사운드링크 플렉스 스피커'
    , mType      : 'sp'
    , dType      : 'type1'
    , price      : 179000
    , colors     : ['#000', '#fff', '#7cafc4', '#306737']
    , sales      : 0
    , isNew      : 'Y'
    , isBest     : 'Y'
    , reviews    : []
    , imgs       : ['sp_type1_img1.jpg', 'sp_type1_img1-1.jpg']
    , made       : ''
  },
  {
      itemCode   : 'sp_type1_0002'
    , itemName   : '[BOSE] 보스 사운드링크 마이크로 스피커'
    , mType      : 'sp'
    , dType      : 'type1'
    , price      : 139000
    , colors     : ['#7cb1bc', '#fff', '#306737']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sp_type1_img2.jpg', 'sp_type1_img2-1.jpg']
    , made       : ''
  },
  {
      itemCode   : 'sp_type1_0003'
    , itemName   : '[BOSE] 보스 사운드링크 리볼브 2 스피커'
    , mType      : 'sp'
    , dType      : 'type1'
    , price      : 299000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'Y'
    , reviews    : []
    , imgs       : ['sp_type1_img3.jpg', 'sp_type1_img3-1.jpg']
    , made       : ''
  },
  {
      itemCode   : 'sp_type1_0004'
    , itemName   : '[BOSE] 보스 포터블 홈 스피커 스피커'
    , mType      : 'sp'
    , dType      : 'type1'
    , price      : 519000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sp_type1_img4.jpg', 'sp_type1_img4-1.jpg']
    , made       : ''
  },
  {
      itemCode   : 'sp_type1_0005'
    , itemName   : '[BOSE] 보스 사운드링크 플렉스 스피커'
    , mType      : 'sp'
    , dType      : 'type1'
    , price      : 179000
    , colors     : ['#fff', '#000', '#7cafc4', '#306737']
    , sales      : 0
    , isNew      : 'Y'
    , isBest     : 'Y'
    , reviews    : []
    , imgs       : ['sp_type1_img1-1.jpg', 'sp_type1_img1.jpg']
    , made       : ''
  },
  {
      itemCode   : 'sp_type1_0006'
    , itemName   : '[BOSE] 보스 사운드링크 마이크로 스피커'
    , mType      : 'sp'
    , dType      : 'type1'
    , price      : 139000
    , colors     : ['#fff', '#7cb1bc', '#306737']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sp_type1_img2-1.jpg', 'sp_type1_img2.jpg']
    , made       : ''
  },
  {
      itemCode   : 'sp_type1_0007'
    , itemName   : '[BOSE] 보스 사운드링크 리볼브 2 스피커'
    , mType      : 'sp'
    , dType      : 'type1'
    , price      : 299000
    , colors     : ['#fff', '#000']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'Y'
    , reviews    : []
    , imgs       : ['sp_type1_img3-1.jpg', 'sp_type1_img3.jpg']
    , made       : ''
  },
  {
      itemCode   : 'sp_type1_0008'
    , itemName   : '[BOSE] 보스 포터블 홈 스피커 스피커'
    , mType      : 'sp'
    , dType      : 'type1'
    , price      : 519000
    , colors     : ['#fff', '#000']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sp_type1_img4-1.jpg', 'sp_type1_img4.jpg']
    , made       : ''
  },
  // ------------------- type2 -------------------
  {
      itemCode   : 'sp_type2_0001'
    , itemName   : '[BOSE] 보스 홈 스피커 500'
    , mType      : 'sp'
    , dType      : 'type2'
    , price      : 499000
    , colors     : ['#fff', '#000']
    , sales      : 389000
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sp_type2_img1.jpg', 'sp_type2_img1-1.jpg']
    , made       : ''
  },
  {
      itemCode   : 'sp_type2_0002'
    , itemName   : '[BOSE] 보스 포터블 홈 스피커 스피커'
    , mType      : 'sp'
    , dType      : 'type2'
    , price      : 519000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sp_type2_img2.jpg', 'sp_type2_img2-1.jpg']
    , made       : ''
  },
  {
      itemCode   : 'sp_type2_0003'
    , itemName   : '[BOSE] 보스 251 실외 스피커'
    , mType      : 'sp'
    , dType      : 'type2'
    , price      : 499000
    , colors     : ['#fff', '#000']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sp_type2_img3.jpg', 'sp_type2_img3-1.jpg']
    , made       : '멕시코'
  },
  {
      itemCode   : 'sp_type2_0004'
    , itemName   : '[BOSE] 보스 S1 프로 플러스 PA 스피커'
    , mType      : 'sp'
    , dType      : 'type2'
    , price      : 880000
    , colors     : ['#000']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sp_type2_img4.jpg']
    , made       : '중국'
  },
  {
      itemCode   : 'sp_type2_0005'
    , itemName   : '[BOSE] 보스 홈 스피커 500'
    , mType      : 'sp'
    , dType      : 'type2'
    , price      : 499000
    , colors     : ['#000', '#fff']
    , sales      : 389000
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sp_type2_img1-1.jpg', 'sp_type2_img1.jpg']
    , made       : ''
  },
  {
      itemCode   : 'sp_type2_0006'
    , itemName   : '[BOSE] 보스 포터블 홈 스피커 스피커'
    , mType      : 'sp'
    , dType      : 'type2'
    , price      : 519000
    , colors     : ['#fff', '#000']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sp_type2_img2-1.jpg', 'sp_type2_img2.jpg']
    , made       : ''
  },
  {
      itemCode   : 'sp_type2_0007'
    , itemName   : '[BOSE] 보스 251 실외 스피커'
    , mType      : 'sp'
    , dType      : 'type2'
    , price      : 499000
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sp_type2_img3-1.jpg', 'sp_type2_img3.jpg']
    , made       : '멕시코'
  },
  {
      itemCode   : 'sp_type2_0008'
    , itemName   : '[BOSE] 보스 S1 프로 플러스 PA 스피커'
    , mType      : 'sp'
    , dType      : 'type2'
    , price      : 880000
    , colors     : ['#000']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sp_type2_img4.jpg']
    , made       : '중국'
  },
  // ------------------- acce -------------------
  {
      itemCode   : 'sp_acce_0001'
    , itemName   : '[BOSE] 보스 포터블 홈 스피커 충전 크래들'
    , mType      : 'sp'
    , dType      : 'acce'
    , price      : 38500
    , colors     : ['#000', '#fff']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sp_acce_img1.jpg', 'sp_acce_img1-1.jpg']
    , made       : '중국'
  },
  {
      itemCode   : 'sp_acce_0002'
    , itemName   : '[BOSE] 보스 사운드링크 리볼브 충전 크래들'
    , mType      : 'sp'
    , dType      : 'acce'
    , price      : 39000
    , colors     : ['#000']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sp_acce_img2.jpg']
    , made       : '중국'
  },
  {
      itemCode   : 'sp_acce_0003'
    , itemName   : '[BOSE] 보스 포터블 홈 스피커 충전 크래들'
    , mType      : 'sp'
    , dType      : 'acce'
    , price      : 38500
    , colors     : ['#fff', '#000']
    , sales      : 0
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['sp_acce_img1-1.jpg', 'sp_acce_img1.jpg']
    , made       : '중국'
  },


  // ====================================================
  // 리퍼상품 (rp)
  // ====================================================
  {
      itemCode   : 'rp_type1_0001'
    , itemName   : '[리퍼브] 보스 QC 울트라 이어버드'
    , mType      : 'rp'
    , dType      : 'type1'
    , price      : 359000
    , colors     : ['#000', '#fff']
    , sales      : 323000
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['rp_type1_img1.jpg', 'rp_type1_img1-1.jpg']
    , made       : '중국'
  },
  {
      itemCode   : 'rp_type1_0002'
    , itemName   : '[리퍼브] 보스 QC 울트라 헤드폰'
    , mType      : 'rp'
    , dType      : 'type1'
    , price      : 499000
    , colors     : ['#000', '#fff']
    , sales      : 449100
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['rp_type1_img2.jpg', 'rp_type1_img2-1.jpg']
    , made       : '태국,중국'
  },
  {
      itemCode   : 'rp_type1_0003'
    , itemName   : '[리퍼브] 보스 QC 헤드폰'
    , mType      : 'rp'
    , dType      : 'type1'
    , price      : 389000
    , colors     : ['#000', '#fff', '#104018']
    , sales      : 330650
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['rp_type1_img3.jpg', 'rp_type1_img3-1.jpg']
    , made       : '태국'
  },
  {
      itemCode   : 'rp_type1_0004'
    , itemName   : '[리퍼브] 보스 스마트 사운드바 300'
    , mType      : 'rp'
    , dType      : 'type1'
    , price      : 599000
    , colors     : ['#000']
    , sales      : 359400
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['rp_type1_img4.jpg']
    , made       : '말레이시아'
  },
  {
      itemCode   : 'rp_type1_0005'
    , itemName   : '[리퍼브] 보스 QC 울트라 이어버드'
    , mType      : 'rp'
    , dType      : 'type1'
    , price      : 359000
    , colors     : ['#fff', '#000']
    , sales      : 323000
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['rp_type1_img1-1.jpg', 'rp_type1_img1.jpg']
    , made       : '중국'
  },
  {
      itemCode   : 'rp_type1_0006'
    , itemName   : '[리퍼브] 보스 QC 울트라 헤드폰'
    , mType      : 'rp'
    , dType      : 'type1'
    , price      : 499000
    , colors     : ['#fff', '#000']
    , sales      : 449100
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['rp_type1_img2-1.jpg', 'rp_type1_img2.jpg']
    , made       : '태국,중국'
  },
  {
      itemCode   : 'rp_type1_0007'
    , itemName   : '[리퍼브] 보스 QC 헤드폰'
    , mType      : 'rp'
    , dType      : 'type1'
    , price      : 389000
    , colors     : ['#fff', '#000', '#104018']
    , sales      : 330650
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['rp_type1_img3-1.jpg', 'rp_type1_img3.jpg']
    , made       : '태국'
  },
  {
      itemCode   : 'rp_type1_0008'
    , itemName   : '[리퍼브] 보스 스마트 사운드바 300'
    , mType      : 'rp'
    , dType      : 'type1'
    , price      : 599000
    , colors     : ['#000']
    , sales      : 359400
    , isNew      : 'N'
    , isBest     : 'N'
    , reviews    : []
    , imgs       : ['rp_type1_img4.jpg']
    , made       : '말레이시아'
  }
];

// console.log(items); // 상품확인

// ====================================================
// 상품 조회
// ====================================================
function getItem(itemCode) {
  for (let i = 0; i < items.length; i++) {
    if (items[i].itemCode === itemCode) {
      return items[i];
    }
  }
  return null;
}

// ====================================================
// 베스트 상품 목록 조회
// ====================================================
function bestItems() {
  let bestItems = [];
  for (let i = 0; i < items.length; i++) {
    if (items[i].isBest === 'Y') {
      bestItems.push(items[i]);
    }
  }
  return bestItems;
}

// ====================================================
// 신규 상품 목록 조회
// ====================================================
function newItems() {
  let newItems = [];
  for (let i = 0; i < items.length; i++) {
    if (items[i].isNew === 'Y') {
      newItems.push(items[i]);
    }
  }
  return newItems;
}

// ====================================================
// 목록별 전체 조회
// ====================================================
function itemList(type) {
  let itemList = [];
  for (let i = 0; i < items.length; i++) {
    if (items[i].mType === type) {
      itemList.push(items[i]);
    }
  }
  return itemList;
}
// ====================================================
// 목록의 타입별 리스트 조회
// ====================================================
function itemType(mType, dType) {
  let itemType = [];
  for (let i = 0; i < items.length; i++) {
    if (items[i].mType === mType && items[i].dType === dType) {
      itemType.push(items[i]);
    }
  }
  return itemType;
}
// ====================================================
// 검색 리스트 조회
// ====================================================
function searchItem(txt) {
  let itemType = [];
  for (let i = 0; i < items.length; i++) {
    if (items[i].itemName.indexOf(txt) > -1) {
      itemType.push(items[i]);
    }
  }
  return itemType;
}

// 사용예시
// console.log(bestItems());
// console.log(itemList('ep'));
// console.log(itemType('sp', 'acce'));
// console.log(getItem('sp_type1_0003'));


// 3자리 숫자마다 , 찍기
function withComma(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}


// 장바구니
let carts = [];
