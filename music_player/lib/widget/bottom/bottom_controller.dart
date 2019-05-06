/**
 * @author Archer
 * @date 2019-05-06
 * Description:
 */
import 'package:flutter/material.dart';
import 'package:music_player/common/utils/view.dart';
import 'package:music_player/common/model/base_model.dart';

class BoxWithBottomPlayerController extends StatelessWidget {
	BoxWithBottomPlayerController(this.child);

	final Widget child;
  @override
  Widget build(BuildContext context) {
  	bool hide = isSoftKeyboardDisplay(MediaQuery.of(context));
    return Column(
			children: <Widget>[
				Expanded(child: child),
				hide ? Container() : BottomContainerBar(),
			],
		);
  }
}

//底部当前音乐播放控制栏
class BottomContainerBar extends StatelessWidget {

//	Widget _buildSubtitle(BuildContext context, Music music) {
//		final playingLyric = Playing
//	}

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
