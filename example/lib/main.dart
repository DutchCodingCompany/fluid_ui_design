import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    FluidConfig config = FluidConfig.fromContext(context, spaceConfig: const SpaceConfig());

    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: config.typeSize(9),
            color: Colors.black,
          ),
          displayMedium: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: config.typeSize(8),
            color: Colors.black,
          ),
          displaySmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: config.typeSize(7),
            color: Colors.black,
          ),
          headlineLarge: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: config.typeSize(6),
            color: Colors.blue,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: config.typeSize(5),
            color: Colors.blue,
          ),
          headlineSmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: config.typeSize(4),
            color: Colors.blue,
          ),
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: config.typeSize(3),
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: config.typeSize(2),
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: config.typeSize(1),
            color: Colors.black,
          ),
        ),
        extensions: <ThemeExtension<dynamic>>[
          config,
        ],
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(context.fluid.spaces.m),
          child: ListView(
            children: <Widget>[
              Text(
                'This is a FluidUI headline large of size: ${Theme.of(context).textTheme.headlineLarge?.fontSize?.toStringAsFixed(1)}',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'This is a FluidUI headline medium of size: ${Theme.of(context).textTheme.headlineMedium?.fontSize?.toStringAsFixed(1)}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'This is a FluidUI headline small of size: ${Theme.of(context).textTheme.headlineSmall?.fontSize?.toStringAsFixed(1)}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'This is a FluidUI body large of size: ${Theme.of(context).textTheme.bodyLarge?.fontSize?.toStringAsFixed(1)}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'This is a FluidUI body medium of size: ${Theme.of(context).textTheme.bodyMedium?.fontSize?.toStringAsFixed(1)}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                'This is a FluidUI body small of size: ${Theme.of(context).textTheme.bodySmall?.fontSize?.toStringAsFixed(1)}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: context.fluid.typeSize(3)),
              ),
              Text('This is a FluidUI body small of size: ${context.fluid.spaces.m}',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: context.fluid.spaces.m,
                    color: Colors.black,
                  ),
                  key: ValueKey(MediaQuery.of(context).size.width / 500)),
              SizedBox(height: context.fluid.spaces.m),
              Text(
                'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text('Padding: ${context.fluid.spaces.m.toString()}'),
              FluidButton(onPressed: () {}),
              SizedBox(height: context.fluid.spaces.m),
              FluidGrid(
                width: MediaQuery.of(context).size.width,
                minimalChildWidth: 200,
                bottomSpacing: context.fluid.spaces.m,
                itemSpacing: context.fluid.spaces.m,
                children: List.generate(
                  6,
                  (index) => Image.network(
                    'https://images.ctfassets.net/4pxjo1vaz7xk/MTY3Mjc1MTE0MDYwOTM/f7060314cecad70c362e8ac5c1698552/hero-hand-bloomer2-app-home-texture-bubble-wrap-mobile-nl.jpg',
                  ),
                ),
              ),
              FluidGrid(
                width: MediaQuery.of(context).size.width,
                minimalChildWidth: 200,
                bottomSpacing: context.fluid.spaces.m,
                itemSpacing: context.fluid.spaces.m,
                maxChildrenPerRow: 3,
                keepItemsSameSize: true,
                children: List.generate(
                  5,
                  (index) => Image.network(
                    'https://www.internetmatters.org/wp-content/uploads/2018/03/Google-family-link-600x356.png',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
