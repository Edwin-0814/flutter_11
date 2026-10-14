import 'package:flutter/cupertino.dart';

void main() {
  runApp(const IOSFlutterApp());
}

class IOSFlutterApp extends StatelessWidget {
  const IOSFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'iOS Target Flutter App',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
        scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
      ),
      home: MainTabScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainTabScreen extends StatelessWidget {
  const MainTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.pencil),
            label: 'Forms',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.photo),
            label: 'Images',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.arrow_right_arrow_left),
            label: 'Transitions',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const HomeOverviewTab();
          case 1:
            return const FormAndInputsTab();
          case 2:
            return const ImageGalleryTab();
          case 3:
            return const TransitionsTab();
          default:
            return const HomeOverviewTab();
        }
      },
    );
  }
}

// ==========================================
// TAB 1: UI & DASHBOARD OVERVIEW (STEP 7)
// ==========================================
class HomeOverviewTab extends StatelessWidget {
  const HomeOverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Experiment 11: iOS Target - Edwin Paul'),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withValues(alpha: 0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(CupertinoIcons.device_phone_portrait,
                          size: 32, color: CupertinoColors.activeBlue),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'iOS Build Target Verified',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    'This Flutter application is configured with Xcode Runner workspace and Cupertino human-interface guidelines for iOS distribution targets.',
                    style: TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Step 7 – Test Application Checklist',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.secondaryLabel,
              ),
            ),
            const SizedBox(height: 8),
            _buildChecklistItem(CupertinoIcons.check_mark_circled_solid, 'UI (Cupertino/Material UI layout)'),
            _buildChecklistItem(CupertinoIcons.check_mark_circled_solid, 'Navigation (Tab bars & Page Route stacks)'),
            _buildChecklistItem(CupertinoIcons.check_mark_circled_solid, 'Text Fields (Inputs, forms, validation)'),
            _buildChecklistItem(CupertinoIcons.check_mark_circled_solid, 'Buttons (CupertinoButtons, Switches)'),
            _buildChecklistItem(CupertinoIcons.check_mark_circled_solid, 'Images (Network images, rounded avatars)'),
            _buildChecklistItem(CupertinoIcons.check_mark_circled_solid, 'Screen Transitions (Cupertino push & modal sheets)'),
          ],
        ),
      ),
    );
  }

  static Widget _buildChecklistItem(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: CupertinoColors.activeGreen, size: 20),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

// ==========================================
// TAB 2: TEXT FIELDS & BUTTONS (STEP 7)
// ==========================================
class FormAndInputsTab extends StatefulWidget {
  const FormAndInputsTab({super.key});

  @override
  State<FormAndInputsTab> createState() => _FormAndInputsTabState();
}

class _FormAndInputsTabState extends State<FormAndInputsTab> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _notificationsEnabled = true;
  int _selectedSegment = 0;
  String _submittedMessage = '';

  void _handleSubmit() {
    setState(() {
      if (_nameController.text.trim().isEmpty) {
        _submittedMessage = 'Please enter your name.';
      } else {
        _submittedMessage =
            'Submitted: ${_nameController.text} (${_emailController.text}) | Segment: ${_selectedSegment == 0 ? "Production" : "Staging"}';
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Text Fields & Buttons'),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Interactive Input Form',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            CupertinoTextField(
              controller: _nameController,
              placeholder: 'Enter Full Name',
              prefix: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(CupertinoIcons.person, color: CupertinoColors.systemGrey),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 12),
            CupertinoTextField(
              controller: _emailController,
              placeholder: 'Enter Email Address',
              keyboardType: TextInputType.emailAddress,
              prefix: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(CupertinoIcons.mail, color: CupertinoColors.systemGrey),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Enable Push Notifications', style: TextStyle(fontSize: 15)),
                  CupertinoSwitch(
                    value: _notificationsEnabled,
                    onChanged: (val) {
                      setState(() => _notificationsEnabled = val);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            CupertinoSegmentedControl<int>(
              children: const {
                0: Padding(padding: EdgeInsets.all(8), child: Text('Production')),
                1: Padding(padding: EdgeInsets.all(8), child: Text('Staging')),
              },
              groupValue: _selectedSegment,
              onValueChanged: (val) {
                setState(() => _selectedSegment = val);
              },
            ),
            const SizedBox(height: 20),
            CupertinoButton.filled(
              onPressed: _handleSubmit,
              child: const Text('Submit Form'),
            ),
            const SizedBox(height: 12),
            if (_submittedMessage.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: CupertinoColors.activeGreen.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: CupertinoColors.activeGreen),
                ),
                child: Text(
                  _submittedMessage,
                  style: const TextStyle(
                    color: CupertinoColors.activeGreen,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// TAB 3: IMAGES & MEDIA (STEP 7)
// ==========================================
class ImageGalleryTab extends StatelessWidget {
  const ImageGalleryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Images & Assets'),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Image Rendering & Avatars',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 180,
                color: CupertinoColors.activeBlue.withValues(alpha: 0.2),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.photo_on_rectangle,
                          size: 64, color: CupertinoColors.activeBlue),
                      SizedBox(height: 8),
                      Text(
                        'Optimized iOS Image Asset Container',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.activeBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAvatar(CupertinoIcons.person_crop_circle_fill, 'User 1'),
                _buildAvatar(CupertinoIcons.person_crop_circle_badge_checkmark, 'User 2'),
                _buildAvatar(CupertinoIcons.person_2_fill, 'Team'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildAvatar(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: CupertinoColors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: CupertinoColors.systemGrey.withValues(alpha: 0.2),
                blurRadius: 4,
              ),
            ],
          ),
          child: Icon(icon, size: 36, color: CupertinoColors.activeBlue),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12, color: CupertinoColors.secondaryLabel)),
      ],
    );
  }
}

// ==========================================
// TAB 4: SCREEN TRANSITIONS & NAVIGATION (STEP 7)
// ==========================================
class TransitionsTab extends StatelessWidget {
  const TransitionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Screen Transitions'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'iOS Navigation & Modal Transitions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              CupertinoButton(
                color: CupertinoColors.activeBlue,
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => const DetailScreen(
                        title: 'CupertinoPageRoute Push',
                        description: 'This screen was pushed using the native iOS sliding transition.',
                      ),
                    ),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.arrow_right),
                    SizedBox(width: 8),
                    Text('Push Detail Screen (Slide Transition)'),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              CupertinoButton(
                color: CupertinoColors.activeOrange,
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      title: const Text('iOS Action Sheet Transition'),
                      message: const Text('Testing bottom modal sheet animation.'),
                      actions: [
                        CupertinoActionSheetAction(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Confirm Action'),
                        ),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        isDestructiveAction: true,
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                    ),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.square_arrow_up),
                    SizedBox(width: 8),
                    Text('Show Modal Action Sheet'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String title;
  final String description;

  const DetailScreen({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(CupertinoIcons.checkmark_seal_fill,
                    size: 80, color: CupertinoColors.activeGreen),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: CupertinoColors.secondaryLabel),
                ),
                const SizedBox(height: 24),
                CupertinoButton.filled(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Back to Home'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
