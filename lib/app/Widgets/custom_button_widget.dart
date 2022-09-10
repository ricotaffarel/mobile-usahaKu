part of 'widgets.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final ButtonStyle? style;
  final Color? primaryColor, borderColor;
  final Function() onTap;
  final TextStyle? textStyle;
  final double? width, height;
  final Widget? leading;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;
  const CustomButtonWidget({
    Key? key,
    required this.title,
    this.style,
    this.primaryColor,
    this.borderColor,
    required this.onTap,
    this.textStyle,
    this.width,
    this.height,
    this.leading,
    this.borderRadius,
    this.padding,
    this.isLoading =false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: height ?? 50,
      width: width ?? Get.width,
      child: ElevatedButton(
        style: style ??
            ElevatedButton.styleFrom(
              padding: padding ??
                  const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
              primary: primaryColor ?? mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
              ),
              elevation: 0,
              side: (borderColor != null)
                  ? BorderSide(
                      color: borderColor!,
                      width: 1,
                    )
                  : BorderSide.none,
            ),
        onPressed: onTap,
        child:(isLoading)?loading(2, diameter: 20): Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leading != null)
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: leading,
              ),
            Expanded(
              child: Text(
                title,
                style: textStyle ?? whiteTextFontTitleBold,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSmallButtonWidget extends StatelessWidget {
  final String title;
  final ButtonStyle? style;
  final Color? primaryColor, borderColor;
  final Function() onTap;
  final TextStyle? textStyle;
  final double? width, height;
  final Widget? leading;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  const CustomSmallButtonWidget({
    Key? key,
    this.title = '',
    this.style,
    this.primaryColor,
    this.borderColor,
    required this.onTap,
    this.textStyle,
    this.width,
    this.height,
    this.leading,
    this.borderRadius,
    this.padding,
    this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: style ??
            ElevatedButton.styleFrom(
              padding: padding ??
                  const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 15,
                  ),
              primary: primaryColor ?? mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
              ),
              elevation: 0,
              visualDensity: VisualDensity.compact,
              tapTargetSize:MaterialTapTargetSize.shrinkWrap,
              side: (borderColor != null)
                  ? BorderSide(
                      color: borderColor!,
                      width: 1,
                    )
                  : BorderSide.none,
            ),
        onPressed: onTap,
        child: child ?? Text(title, style: textStyle ?? whiteTextFontBold),
      ),
    );
  }
}

class CustomButtonWidget2 extends StatelessWidget {
  final String title;
  final ButtonStyle? style;
  final Color? primaryColor, borderColor;
  final Function() onTap;
  final TextStyle? textStyle;
  final double? width, height;
  final Widget? leading;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  const CustomButtonWidget2({
    Key? key,
    required this.title,
    this.style,
    this.primaryColor,
    this.borderColor,
    required this.onTap,
    this.textStyle,
    this.width,
    this.height,
    this.leading,
    this.borderRadius,
    this.padding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style ??
          ElevatedButton.styleFrom(
            padding: padding ??
                const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
            primary: primaryColor ?? mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
            ),
            elevation: 0,
            side: (borderColor != null)
                ? BorderSide(
                    color: borderColor!,
                    width: 1,
                  )
                : BorderSide.none,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity:VisualDensity.compact 
          ),
      onPressed: onTap,
      child: Text(
              title,
              style: textStyle ?? whiteTextFontTitleBold,
              textAlign: TextAlign.center,
            ),
    );
  }
}
