part of 'widgets.dart';

class DataNotFoundWidget extends StatelessWidget {
  final String? message;
  final String? subMessage;

  const DataNotFoundWidget({Key? key, this.message, this.subMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  'assets/lottie/empty_2.json',
                  height: 180,
                  fit: BoxFit.cover,
                ),
                Text(
                  message ?? 'Data Kosong',
                  style: greyTextFontBig,
                ),
                if (subMessage != null)
                  Text(
                    subMessage!,
                    style: greyTextFont,
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
