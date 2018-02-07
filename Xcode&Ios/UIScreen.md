# UI 속성 받아오기

- UIScreen.main.bounds : 기기의 포인트 받아옮
- UIScreen.main.scale : 기기의 해상도를 받아옮
- let osVer = ProcessInfo.processInfo.operatingSystemVersion : OS버전을 받아옮
- 하위호환성 유지하기

```swift
if #available(ios 11.0,*){
    /*ios 11이상의 코드*/
} else{
    /*이전 버전*/
}
```

- 시뮬레이터 코드 분기

```swift
#if (arch(i386) || arch(x86_64)) && os(iOS)
 print("SIMULATOR")
#else
 print("ACTUAL DEVICE")
#endif 
```