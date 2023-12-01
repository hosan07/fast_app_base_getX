// ignore_for_file: constant_identifier_names, use_key_in_widget_constructors

import 'package:baseapp_getx/index.dart';
import 'package:shimmer/shimmer.dart';

enum LoadingType {
  CircularProgressIndicator,
  Shimmer_40_2,
  Shimmer_48_2,
}

class WtLoadingView extends StatefulWidget {
  WtLoadingView({
    this.shrinkWrap = false,
  }) {
    loadingType = LoadingType.CircularProgressIndicator;
  }

  WtLoadingView.shimmer40({
    this.shrinkWrap = false,
  }) {
    loadingType = LoadingType.Shimmer_40_2;
  }

  WtLoadingView.shimmer48({
    this.shrinkWrap = false,
  }) {
    loadingType = LoadingType.Shimmer_48_2;
  }

  /// 로딩뷰 로딩타입
  late final LoadingType loadingType;

  /// 스크롤 내부에 사용 true, 아닌경우 false
  final bool shrinkWrap;

  @override
  WtLoadingViewState createState() => WtLoadingViewState();
}

class WtLoadingViewState extends State<WtLoadingView> {
  @override
  Widget build(BuildContext context) {
    switch (widget.loadingType) {
      case LoadingType.CircularProgressIndicator:
        return const Center(
          child: CircularProgressIndicator(
            strokeWidth: 3,
          ),
        );
      case LoadingType.Shimmer_40_2:
        return shimmer_2line(40);
      case LoadingType.Shimmer_48_2:
        return shimmer_2line(48);
    }
  }

  Widget shimmer_2line(double profileSize) {
    double lineHeight = (profileSize - 4) / 2;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          widget.shrinkWrap ? shrinkWrapListView2(profileSize, lineHeight) : listViewWidget2(profileSize, lineHeight),
        ],
      ),
    );
  }

  Widget shrinkWrapListView2(double profileSize, double lineHeight) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.grey[50]!,
        child: ListView.builder(
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: profileSize,
                  height: profileSize,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: constraints.maxWidth,
                            height: lineHeight,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: constraints.maxWidth / 2,
                            height: lineHeight,
                            color: Colors.white,
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          itemCount: 20,
        ),
      ),
    );
  }

  Widget listViewWidget2(double profileSize, double lineHeight) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.grey[50]!,
        child: ListView.builder(
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: profileSize,
                  height: profileSize,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: constraints.maxWidth,
                            height: lineHeight,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: constraints.maxWidth / 2,
                            height: lineHeight,
                            color: Colors.white,
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          itemCount: 20,
        ),
      ),
    );
  }

  Widget shimmer_3line(double profileSize) {
    double lineHeight = (profileSize - 8) / 3;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        children: <Widget>[
          widget.shrinkWrap ? shrinkWrapListView3(profileSize, lineHeight) : listViewWidget3(profileSize, lineHeight),
        ],
      ),
    );
  }

  Widget shrinkWrapListView3(double profileSize, double lineHeight) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[50]!,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (_, __) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: profileSize,
                height: profileSize,
                color: Colors.white,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: constraints.maxWidth,
                          height: lineHeight,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: constraints.maxWidth,
                          height: lineHeight,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: constraints.maxWidth / 2,
                          height: lineHeight,
                          color: Colors.white,
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
        itemCount: 20,
      ),
    );
  }

  Widget listViewWidget3(double profileSize, double lineHeight) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.grey[50]!,
        child: ListView.builder(
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: profileSize,
                  height: profileSize,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: constraints.maxWidth,
                            height: lineHeight,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: constraints.maxWidth,
                            height: lineHeight,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: constraints.maxWidth / 2,
                            height: lineHeight,
                            color: Colors.white,
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          itemCount: 20,
        ),
      ),
    );
  }
}
