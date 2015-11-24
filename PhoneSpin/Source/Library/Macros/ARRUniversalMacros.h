//
//  ARRUniversalMacroses.h
//  Task#1
//
//  Created by Igor Arsenkin on 15.09.15.
//  Copyright (c) 2015 Igor Arsenkin. All rights reserved.
//

#ifndef Task_1_ARRUniversalMacroses_h
#define Task_1_ARRUniversalMacroses_h

//************************************

#define ARREmpty

#define ARRWeakify(var) \
    __weak typeof(var) __weak##__var = var

#define ARRStrongify(var) \
    __strong typeof(__weak##__var) var = __weak##__var

#define ARRStrongifyAndReturnEntityIfNil(var, entity) \
    ARRStrongify(var); \
    if (!var) { \
        return entity; \
    }

#define ARRStrongifyAndReturnIfNil(var) \
    ARRStrongifyAndReturnEntityIfNil(var, ARREmpty)

#define ARRStrongifyAndReturnNilIfNil(var) \
    ARRStrongifyAndReturnEntityIfNil(var, nil)

//***********************************

#define ARRMainViewProperty(viewClass, propertyName) \
    @property (nonatomic, readonly) viewClass    *propertyName;

#define ARRMainViewGetter(viewClass, selector) \
    - (viewClass *)selector { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
        \
        return nil; \
    }

#define ARRViewControllerMainViewProperty(viewControllerClass, propertyName, mainViewClass) \
    @interface viewControllerClass (__ARRPrivateMainView_##propertyName) \
    ARRMainViewProperty(mainViewClass, propertyName) \
    \
    @end \
    \
    @implementation viewControllerClass (__ARRPrivateMainView_##propertyName) \
    \
    @dynamic propertyName; \
    \
    ARRMainViewGetter(mainViewClass, propertyName) \
    \
    @end

#endif

//***********************************

#define ARRDiagnosticPush \
    _Pragma("clang diagnostic push")

#define ARRIgnoredPerformSelectorLeaks(code) \
    _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
    code

#define ARRDiagnosticPop \
    _Pragma("clang diagnostic pop")

#define ARRSuppressPerformSelectorLeakWarning(code) \
    ARRDiagnosticPush \
    ARRIgnoredPerformSelectorLeaks(code) \
    ARRDiagnosticPop

//***********************************

#define ARRSynthesizeSetterWithObserver(propertyName) \
    if (_##propertyName != propertyName) { \
        [_##propertyName removeObserver:self]; \
        _##propertyName = propertyName; \
        [_##propertyName addObserver:self]; \
    }

#define ARRSynthesizeSetterWithObserverAndLoad(propertyName) \
    if (_##propertyName != propertyName) { \
        [_##propertyName removeObserver:self]; \
        _##propertyName = propertyName; \
        [_##propertyName addObserver:self]; \
        [_##propertyName load]; \
    }

//***********************************

#define ARRSleepDefine 1

#if ARRSleepDefine == 1
    #define ARRSleep(time) [NSThread sleepForTimeInterval:time]
#else
    #define ARRSleep(time)
#endif
