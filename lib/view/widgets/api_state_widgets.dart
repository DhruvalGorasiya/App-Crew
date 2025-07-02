import 'package:app_crew/exports/exports.dart';

Widget loadingWidget({double? size, double? strokeWidth, double? value}) {
  // return SpinKitThreeBounce(
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: size ?? 24,
        width: size ?? 24,
        child: CircularProgressIndicator(
          value: value,
          color: primaryColor,
          backgroundColor: primaryColor.withOpacity(0.2),
          strokeWidth: strokeWidth ?? (size != null ? size / 6 : 4),
        ),
      ),
    ),
  );
}

Widget errorWidget({String? error, VoidCallback? onTryAgain}) {
  return NoItemFoundForPagination(
    title: somethingWentWrong,
    message: error,
    onTryAgain: onTryAgain,
  );
}

Widget noItemsFoundWidget({String? text, VoidCallback? onTryAgain}) {
  return NoItemFoundForPagination(
    title: text,
    onTryAgain: onTryAgain,
  );
}

class NoItemFoundForPagination extends StatelessWidget {
  const NoItemFoundForPagination({
    this.title,
    this.message,
    this.onTryAgain,
    super.key,
  });

  final String? title;
  final String? message;
  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) {
    final message = this.message;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 28,
          ),
          Text(
            title ?? 'No items found',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 16,
          ),
          if (message != null)
            Text(
              message ?? 'The list is currently empty.',
              textAlign: TextAlign.center,
            ),
          if (onTryAgain != null)
            const SizedBox(
              height: 28,
            ),
          if (onTryAgain != null)
            SizedBox(
              height: 44,
              width: sizer(context, 0.25),
              child: OutlinedButton.icon(
                onPressed: onTryAgain,
                icon: const Icon(
                  Icons.refresh,
                ),
                label: const Text(
                  'Try Again',
                ),
              ),
            ),
          const SizedBox(
            height: 28,
          ),
        ],
      ),
    );
  }
}
