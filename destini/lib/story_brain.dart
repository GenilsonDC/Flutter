import 'story.dart';
class StoryBrain {
  List<Story> _storyData = [
    Story(
      storyTitle:
      'You are an astronaut traveling alone through the vastness of space in your spaceship. Suddenly, your ship malfunctions and you are stranded near an uncharted planet. A strange, glowing alien spaceship hovers nearby and a hologram of an alien with deep-set eyes appears, asking: "Need assistance, human?".',
      choice1: 'I\'ll accept the help. Better to take a chance.',
      choice2: 'Ask the alien what kind of assistance they offer first.',
    ),
    Story(
      storyTitle:
      'The alien says they can fix your ship but need to bring you aboard their vessel first.',
      choice1: 'Agree and board the alien ship.',
      choice2: 'Refuse and try to fix your ship on your own.',
    ),
    Story(
      storyTitle:
      'Inside the alien ship, the atmosphere is filled with a strange but pleasant aroma. The alien shows you a device that can fix your ship but warns that it requires a sample of your DNA.',
      choice1: 'Provide your DNA sample.',
      choice2: 'Refuse and ask for another solution.',
    ),
    Story(
      storyTitle:
      'The alien uses your DNA and successfully fixes your ship. However, they now seem overly interested in you, asking many personal questions.',
      choice1: 'Answer the questions honestly.',
      choice2: 'Lie to the alien to protect your identity.',
    ),
    Story(
      storyTitle:
      'The alien becomes angry, feeling betrayed by your lies. They detain you and start experimenting on you.',
      choice1: 'Try to escape.',
      choice2: 'Accept your fate and hope for the best.',
    ),
    Story(
      storyTitle:
      'You manage to escape the alien ship and return to your own, but the alien ship is now in pursuit. You must decide whether to fight or flee.',
      choice1: 'Engage in a space battle.',
      choice2: 'Use the ship\'s warp drive to escape to another galaxy.',
    ),
    Story(
      storyTitle:
      'You successfully defeat the alien ship in a fierce battle, but your ship is severely damaged. You send a distress signal and hope for rescue.',
      choice1: 'Restart',
      choice2: '',
    ),
    Story(
      storyTitle:
      'You activate the warp drive and escape to safety. As you relax, you realize you have new data on a previously unknown alien species.',
      choice1: 'Restart',
      choice2: '',
    ),
  ];
  int _storyNumber = 0;

  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  void nextStory(int choiceNumber) {
    switch (_storyNumber) {
      case 0:
        if (choiceNumber == 1) {
          _storyNumber = 1;
        } else {
          _storyNumber = 2;
        }
        break;
      case 1:
        if (choiceNumber == 1) {
          _storyNumber = 2;
        } else {
          _storyNumber = 3;
        }
        break;
      case 2:
        if (choiceNumber == 1) {
          _storyNumber = 4;
        } else {
          _storyNumber = 5;
        }
        break;
      case 3:
        if (choiceNumber == 1) {
          _storyNumber = 6;
        } else {
          _storyNumber = 7;
        }
        break;
      case 4:
        if (choiceNumber == 1) {
          _storyNumber = 6;
        } else {
          _storyNumber = 7;
        }
        break;
      case 5:
        if (choiceNumber == 1) {
          _storyNumber = 6;
        } else {
          _storyNumber = 7;
        }
        break;
      case 6:
      case 7:
        restart();
        break;
    }
  }

  void restart() {
    _storyNumber = 0;
  }

  bool buttonShouldBeVisible() {
    if (_storyNumber == 6 || _storyNumber == 7) {
      return false;
    } else {
      return true;
    }
  }
}