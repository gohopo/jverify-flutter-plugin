import {
  GenAuthThemeConfigBuilder,
  JVerificationInterface, JVerificationLoginSettings, JVerifyUIConfig,
  JVerifyUIConfigBuilder } from '@jg/verify';
import {
  AbilityAware,
  AbilityPluginBinding,
  FlutterPlugin,
  FlutterPluginBinding,
  MethodCall,
  MethodCallHandler,
  MethodChannel,
  MethodResult,
} from '@ohos/flutter_ohos';
import { HashMap } from '@kit.ArkTS';
import UIAbility from '@ohos.app.ability.UIAbility';

/** JverifyPlugin **/
export default class JverifyPlugin implements FlutterPlugin, MethodCallHandler, AbilityAware {
  private channel!: MethodChannel;
  private context!: Context;
  private uiAbility!: UIAbility;

  constructor() {
  }

  getUniqueClassName(): string {
    return "JverifyPlugin"
  }

  onAttachedToEngine(binding: FlutterPluginBinding): void {
    this.channel = new MethodChannel(binding.getBinaryMessenger(), "jverify");
    this.channel.setMethodCallHandler(this);
    this.context = binding.getApplicationContext();
  }

  onDetachedFromEngine(binding: FlutterPluginBinding): void {
    if (this.channel != null) {
      this.channel.setMethodCallHandler(null)
    }
  }

  onAttachedToAbility(binding: AbilityPluginBinding): void {
    this.uiAbility = binding.getAbility();
  }

  onDetachedFromAbility(): void {

  }

  onMethodCall(call: MethodCall, result: MethodResult): void {
    if (call.method == "checkVerifyEnable") {
      this.checkVerifyEnable(call,result);
    } else if (call.method == "isInitSuccess") {
      this.isInitSuccess(call,result);
    } else if (call.method == "loginAuth") {
      this.loginAuth(call,result);
    } else if (call.method == "preLogin") {
      this.preLogin(call,result);
    } else if (call.method == "setCustomAuthorizationView") {
      this.setCustomAuthorizationView(call,result);
    } else if (call.method == "setup") {
      this.setup(call,result);
    } else {
      result.notImplemented()
    }
  }

  async checkVerifyEnable(call: MethodCall, result: MethodResult){
    let verifyEnable: boolean = await JVerificationInterface.checkVerifyEnable();
    result.success({result:verifyEnable});
  }
  isInitSuccess(call: MethodCall, result: MethodResult){
    let isSuccess = JVerificationInterface.isInitSuccess();
    result.success({result:isSuccess});
  }
  layoutOriginOuthView(uiConfig: HashMap<string,ESObject>, builder: JVerifyUIConfigBuilder){
    let authBackgroundImage = uiConfig.get('authBackgroundImage') as string;
    let logoOffsetX = uiConfig.get('logoOffsetX') as number;
    let logoOffsetY = uiConfig.get('logoOffsetY') as number;
    let logoWidth = uiConfig.get('logoWidth') as number;
    let logoHeight = uiConfig.get('logoHeight') as number;
    let logoImgPath = uiConfig.get('logoImgPath') as string;
    let logoHidden = uiConfig.get('logoHidden') as boolean;
    let numFieldOffsetX = uiConfig.get('numFieldOffsetX') as number;
    let numFieldOffsetY = uiConfig.get('numFieldOffsetY') as number;
    let numberFieldWidth = uiConfig.get('numberFieldWidth') as number;
    let numberFieldHeight = uiConfig.get('numberFieldHeight') as number;
    let numberSize = uiConfig.get('numberSize') as number;
    let numberColor = uiConfig.get('numberColor') as number;
    let numberTextBold = uiConfig.get('numberTextBold') as boolean;
    let sloganOffsetX = uiConfig.get('sloganOffsetX') as number;
    let sloganOffsetY = uiConfig.get('sloganOffsetY') as number;
    let sloganTextSize = uiConfig.get('sloganTextSize') as number;
    let sloganTextColor = uiConfig.get('sloganTextColor') as number;
    let sloganTextBold = uiConfig.get('sloganTextBold') as boolean;
    let logBtnOffsetX = uiConfig.get('logBtnOffsetX') as number;
    let logBtnOffsetY = uiConfig.get('logBtnOffsetY') as number;
    let logBtnWidth = uiConfig.get('logBtnWidth') as number;
    let logBtnHeight = uiConfig.get('logBtnHeight') as number;
    let logBtnText = uiConfig.get('logBtnText') as string;
    let logBtnTextSize = uiConfig.get('logBtnTextSize') as number;
    let logBtnTextColor = uiConfig.get('logBtnTextColor') as number;
    let logBtnTextBold = uiConfig.get('logBtnTextBold') as boolean;
    let logBtnBackgroundPath = uiConfig.get('logBtnBackgroundPath') as string;
    let privacyCheckboxSize = uiConfig.get('privacyCheckboxSize') as number;
    let checkedImgPath = uiConfig.get('checkedImgPath') as string;
    let uncheckedImgPath = uiConfig.get('uncheckedImgPath') as string;
    let privacyText = uiConfig.get('privacyText') as string;
    let privacyTextSize = uiConfig.get('privacyTextSize') as number;
    let privacyTextBold = uiConfig.get('privacyTextBold') as boolean;
    let privacyUnderlineText = uiConfig.get('privacyUnderlineText') as boolean;
    let privacyTextCenterGravity = uiConfig.get('privacyTextCenterGravity') as boolean;
    let privacyCheckboxInCenter = uiConfig.get('privacyCheckboxInCenter') as boolean;
    let privacyState = uiConfig.get('privacyState') as boolean;
    let privacyNavColor = uiConfig.get('privacyNavColor') as number;
    let privacyNavTitleTextSize = uiConfig.get('privacyNavTitleTextSize') as number;
    let privacyNavTitleTextColor = uiConfig.get('privacyNavTitleTextColor') as number;
    let privacyNavTitleTextBold = uiConfig.get('privacyNavTitleTextBold') as boolean;
    let privacyNavReturnBtnPath = uiConfig.get('privacyNavReturnBtnPath') as string;

    if(authBackgroundImage) builder.setAuthBGImgPath(authBackgroundImage);
    if(logoOffsetX!=null) builder.setLogoOffsetX(logoOffsetX);
    if(logoOffsetY!=null) builder.setLogoOffsetY(logoOffsetY);
    if(logoWidth!=null) builder.setLogoWidth(logoWidth);
    if(logoHeight!=null) builder.setLogoHeight(logoHeight);
    if(logoImgPath!=null) builder.setLogoImgPath(logoImgPath);
    if(logoHidden!=null) builder.setLogoHidden(logoHidden);
    if(numFieldOffsetX!=null) builder.setNumberFieldOffsetX(numFieldOffsetX);
    if(numFieldOffsetY!=null) builder.setNumberFieldOffsetY(numFieldOffsetY);
    if(numberFieldWidth!=null) builder.setNumberFieldWidth(numberFieldWidth);
    if(numberFieldHeight!=null) builder.setNumberFieldHeight(numberFieldHeight);
    if(numberSize!=null) builder.setNumberSize(numberSize);
    if(numberColor!=null) builder.setNumberColor(numberColor);
    if(numberTextBold!=null) builder.setNumberTextBold(numberTextBold);
    if(sloganOffsetX!=null) builder.setSloganOffsetX(sloganOffsetX);
    if(sloganOffsetY!=null) builder.setSloganOffsetY(sloganOffsetY);
    if(sloganTextSize!=null) builder.setSloganTextSize(sloganTextSize);
    if(sloganTextColor!=null) builder.setSloganTextColor(sloganTextColor);
    if(sloganTextBold!=null) builder.setSloganTextBold(sloganTextBold);
    if(logBtnOffsetX!=null) builder.setLogBtnOffsetX(logBtnOffsetX);
    if(logBtnOffsetY!=null) builder.setLogBtnOffsetY(logBtnOffsetY);
    if(logBtnWidth!=null) builder.setLogBtnWidth(logBtnWidth);
    if(logBtnHeight!=null) builder.setLogBtnHeight(logBtnHeight);
    if(logBtnText!=null) builder.setLogBtnText(logBtnText);
    if(logBtnTextSize!=null) builder.setLogBtnTextSize(logBtnTextSize);
    if(logBtnTextColor!=null) builder.setLogBtnTextColor(logBtnTextColor);
    if(logBtnTextBold!=null) builder.setLogBtnTextBold(logBtnTextBold);
    if(logBtnBackgroundPath!=null) builder.setLogBtnImgPath(logBtnBackgroundPath);
    if(privacyCheckboxSize!=null) builder.setPrivacyCheckboxSize(privacyCheckboxSize);
    if(checkedImgPath!=null) builder.setCheckedImgPath(checkedImgPath);
    if(uncheckedImgPath!=null) builder.setUncheckedImgPath(uncheckedImgPath);
    if(privacyText!=null) builder.setPrivacyText(privacyText[0],privacyText[1]);
    if(privacyTextSize!=null) builder.setPrivacyTextSize(privacyTextSize);
    if(privacyTextBold!=null) builder.setPrivacyTextBold(privacyTextBold);
    if(privacyUnderlineText!=null) builder.setPrivacyUnderlineText(privacyUnderlineText);
    if(privacyTextCenterGravity!=null) builder.setPrivacyTextCenterGravity(privacyTextCenterGravity);
    if(privacyCheckboxInCenter!=null) builder.setPrivacyCheckboxInCenter(privacyCheckboxInCenter);
    if(privacyState!=null) builder.setPrivacyState(privacyState);
    if(privacyNavColor!=null) builder.setPrivacyNavColor(privacyNavColor);
    if(privacyNavTitleTextSize!=null) builder.setPrivacyNavTitleTextSize(privacyNavTitleTextSize);
    if(privacyNavTitleTextColor!=null) builder.setPrivacyNavTitleTextColor(privacyNavTitleTextColor);
    if(privacyNavTitleTextBold!=null) builder.setPrivacyNavTitleTextBold(privacyNavTitleTextBold);
    if(privacyNavReturnBtnPath!=null) builder.setPrivacyNavReturnBtnPath(privacyNavReturnBtnPath);

    builder.setLogBtnHeight(50);
    builder.setLogBtnWidth(270);
    builder.setTopSafeAreaHeight(50);

    this.layoutOriginOuthViewCM(builder);
  }
  layoutOriginOuthViewCM(jgBuilder: JVerifyUIConfigBuilder){
    let builder = new GenAuthThemeConfigBuilder();

    builder.setLogBtnText('本机号码一键登录');
    builder.setLoginBtnBorderRadius(12);
    builder.setLoginBtnColor(0xffbe00);
    builder.setLoginBtnHeight(50);
    builder.setLoginBtnMargin({top:550});
    builder.setLoginBtnTextColor(Color.Black);
    builder.setLoginBtnTextSize(15);
    builder.setLoginBtnWidth(270);

    builder.setNumberColor(Color.Black);
    builder.setNumberSize(36);
    builder.setNumberMargin({top:200});

    jgBuilder.setCmUIConfig(builder);
  }
  loginAuth(call: MethodCall, result: MethodResult){
    let autoDismiss: boolean = call.argument('autoDismiss');
    let timeout: number = call.argument('timeout');

    let uiContext = this.uiAbility.context.windowStage.getMainWindowSync().getUIContext();
    let settings = new JVerificationLoginSettings(uiContext);
    settings.autoFinish = autoDismiss;
    settings.timeout = timeout;
    JVerificationInterface.loginAuth(settings,(code,msg,operateRet)=>{
      result.success({code,message:msg,operator:operateRet});
    });
  }
  preLogin(call: MethodCall, result: MethodResult){
    let timeOut: number|undefined = call.argument('timeOut');
    JVerificationInterface.prelogin((code,msg,operateRet)=>{
      result.success({code,message:msg});
    },timeOut);
  }
  setCustomAuthorizationView(call: MethodCall, result: MethodResult){
    let portraitConfig: HashMap<string,ESObject> = call.argument('portraitConfig');

    let portraitBuilder = new JVerifyUIConfigBuilder();
    this.layoutOriginOuthView(portraitConfig,portraitBuilder);
    let portrait: JVerifyUIConfig = portraitBuilder.build();

    JVerificationInterface.setCustomUIWithConfig(portrait);
  }
  setup(call: MethodCall, result: MethodResult){
    let appKey: string = call.argument('appKey');
    JVerificationInterface.init(this.context.getApplicationContext(),appKey,(code: number, msg: string)=>{
      result.success({code,message:msg});
    });
  }
}