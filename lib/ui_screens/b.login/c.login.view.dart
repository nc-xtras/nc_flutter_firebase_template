part of '_index.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login View'),
      ),
      body: OnBuilder.data(
        listenTo: _dt.rxUser,
        builder: (data) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await _ct.signInAnonymous();
                },
                child: const Text(
                  "Login Anonymous",
                ),
              ),

              // * kalau mau liat usernya null atau tida buka aja komen text ini

              // OnReactive(
              //   () => Text('${_dt.rxUser.state?.uid}'),
              // ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await _ct.signInByGoogle();
                },
                child: const Text(
                  "Login by Google",
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
