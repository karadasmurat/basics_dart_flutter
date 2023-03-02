void main() async {
  var subject = NewsPublisher();
  var observer = Subscriber();
  subject.addObserver(observer);

  await subject.publish();
}

abstract class Observable {
  void addObserver(Observer o);

  void removeObserver(Observer o);

  void notifyObservers(dynamic arg);
}

abstract class Observer {
  update(dynamic arg);
}

// Concrete implementation of Observer
class Subscriber implements Observer {
  @override
  update(arg) {
    print("Subscriber ${this.hashCode} received an update: $arg");
  }
}

// Concrete implementation of Observable
class NewsPublisher implements Observable {
  String news = "";
  bool changed = false;
  var observers = <Observer>[];

  // sample method that changes state observers are interested.
  // Therefore, notifyObservers() is called.
  void setNews(String arg) {
    news = arg;
    notifyObservers(news);
  }

  Future<void> publish() async {
    var news = ["News 1", "News2", "News3"];
    for (var n in news) {
      await Future.delayed(Duration(seconds: 2));
      setNews(n);
    }
  }

  @override
  void addObserver(Observer o) {
    observers.add(o);
  }

  @override
  void removeObserver(Observer o) {
    if (observers.contains(o)) observers.remove(o);
  }

  @override
  void notifyObservers(arg) {
    for (var obs in observers) {
      obs.update(arg);
    }
  }
}
