void main(List<String> args) {
  var light = Light();
  Command lightOn = LightOnCommand(light);
  Command lightOff = LightOffCommand(light);
  var remote = SimpleRemote(lightOff);
  remote.buttonPressed();

  remote.button = lightOn;
  remote.buttonPressed();

  var sec = SecuritySystem();
  Command armSecuritySystem = ArmCommand(sec);
  remote.button = armSecuritySystem;
  remote.buttonPressed();
}

// Receiver knows how to perform the work, contains business logic.
// Any class can act as a Receiver.
class Light {
  bool isOn;

  Light({this.isOn = false});

  void on() {
    if (isOn) {
      print("Lights are already on..");
    } else {
      print("Turning the lights on.");
      isOn = true;
    }
  }

  void off() {
    if (!isOn) {
      print("Lights are already off..");
    } else {
      print("Turning the lights off");
      isOn = false;
    }
  }
}

// Receiver
class SecuritySystem {
  void arm() {
    print("Security System armed.");

    //beep sound
    print(String.fromCharCodes([0x07]));
    print(String.fromCharCodes([0x07]));
  }

  void disarm() {
    print("Security System disarmed.");
  }
}

// Declare an interface for all commands.
abstract class Command {
  void execute();
}

// Concrete command defines a binding between an action and a Receiver.
// The invoker makes a request by calling execute() and
// the concreteImplementation of Command carries it out by calling actions on the Receiver.
class LightOnCommand implements Command {
  // Command holds the Receiver
  Light light;

  LightOnCommand(this.light);

  @override
  void execute() {
    light.on();
  }
}

// Concrete command
class LightOffCommand implements Command {
  Light light;

  LightOffCommand(this.light);

  @override
  void execute() {
    light.off();
  }
}

// Concrete command
class ArmCommand extends Command {
  SecuritySystem sec;

  ArmCommand(this.sec);

  @override
  void execute() {
    sec.arm();
  }
}

// Invoker
// Invoker holds a command and at some point ask it to carry out a request by calling its execute() method.
// Invoker optionally does bookkeeping about the command execution.
class SimpleRemote {
  // Invoker holds a command
  Command button;

  SimpleRemote(this.button);

  void buttonPressed() {
    button.execute();
  }
}
