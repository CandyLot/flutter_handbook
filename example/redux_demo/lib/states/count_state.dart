import 'package:meta/meta.dart';

/**
 * state 中所有属性应该是只读
 */
@immutable
class CountState {
  final int _count;
  get count => _count;

  CountState(this._count);
  CountState.initState() : _count = 0;
}

/**
 * 定义操作改 state 的全部 Action
 * 这里只有一个增加 count 的操作
 */
enum Count_Action { increment }

/**
 * reducer 会根据传进来的 action 生成新的 CountState
 */
CountState reducer(CountState state, action) {
  // 匹配 Action
  if(action == Count_Action.increment) {
    return CountState(state.count + 1);
  }
  return state;
}