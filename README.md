# holographicCardUnityShader

20년도 2학기 게임프로그래밍 강의 프로젝트<br><br>
홀로그래픽 카드 제작 <br> <br>
## 📃 상세 내용
- **목적 :**
    - 보는 방향에 따라 달라지는 홀로그래픽 카드를 만들고자 함.
- **구현한 기능 :**
    - 날개 짓 하는 나비 표현
    - 보는 방향에 따라 다른 반짝임, 그림 구현
    
## 🖥 사용 기술 및 라이브러리

- Unity
- Unity Shader

## 🖱 담당한 기능

- Quad에 쉐이더를 이용하여 Sin파와 여러가지 효과를 주어 나비의 움직임을 표현
    - 조금 더 자연스러운 효과를 위해 y =(sin(abs(x)+t))-abs(x) 식을 이용
    - 바람의 영향을 주기 위해 앞뒤로도 흔들리는 느낌을 추가
    - Quad를 사용하여 메쉬를 조절하여 더 자연스러운 느낌 부여
- noise이미지를 통해 반짝임을 표현
- 나비의 경우 스탠실을 이용하여 공간감은 있지만, 2D로 보이게 표현

<br>
바람의 영향에 따른 날개 표현
<br>
![바람날개](https://user-images.githubusercontent.com/76572665/215289243-4ea56bc8-a5d2-4292-842f-9913ff04e4e7.gif)

<br>
노이즈를 이용한 반짝임 표현
<br>
![Uploading 반짝.gif…]()

<br>
스탠실
<br>
![스탠실](https://user-images.githubusercontent.com/76572665/184395913-37e69715-38e0-4ff5-8b74-5a10611ec811.gif)

<br>
그 외 홀로그래픽 느낌 표현
<br>
![hologram](https://user-images.githubusercontent.com/76572665/184396194-41eaa9ec-d2e9-4450-b2eb-4e545998894f.gif)


<br>


총 완성본 gif <br>

![완성](https://user-images.githubusercontent.com/76572665/184391762-8cb150bf-92bc-4ee1-98de-c0ce2568bea9.gif)
