import 'package:flutter/material.dart';

import '../../common/styles/colors.dart';

class StateHandling {
  static Widget onInit() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            height: 200,
            margin: const EdgeInsets.all(22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.manage_search,
                  size: 100,
                  color: Colors.black38,
                ),
                Text(
                  'Nothing to search for now',
                  style: TextStyle(
                    fontSize: 20,
                    color: MyColor.greyTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget onLoading() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  static Widget onError(String title) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            height: 200,
            width: double.infinity,
            margin: const EdgeInsets.all(22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.warning,
                  size: 100,
                  color: Colors.black38,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: MyColor.greyTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
