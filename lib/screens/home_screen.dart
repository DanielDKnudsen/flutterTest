// screens/home_screen.dart
class HomeScreen extends StatefulWidget {/*...*/}

class HomeScreenState extends State<HomeScreen> {
  // new
  AppState appState;

  // new
  Widget get _pageToDisplay {
    if (appState.isLoading) {
      return _loadingView;
    } else {
      return _homeView;
    }
  }

  // new
  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  // new
  Widget get _homeView {
    return new Center(child: new Text(appState.user.displayName));
  }

  @override
  Widget build(BuildContext context) {
    // This is the InheritedWidget in action.
    // You can reference the StatefulWidget that
    // wraps it like this, which allows you to access any
    // public method or property on it.
    var container = AppStateContainer.of(context);
    // For example, get grab its property called state!
    appState = container.state;
    // Everything this build method is called, which is when the state
    // changes, Flutter will 'get' the _pageToDisplay widget, which will
    // return the screen we want based on the appState.isLoading
    Widget body = _pageToDisplay;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Suite'),
      ),
      // Replace the hardcoded widget
      // with our widget that switches.
      body: body,
    );
  }
}
