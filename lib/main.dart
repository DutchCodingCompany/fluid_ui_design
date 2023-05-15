import 'package:fluid_ui_design/fluid_size.dart';
import 'package:fluid_ui_design/screen_size_helper.dart';
import 'package:fluid_ui_design/text_theme.dart';
import 'package:flutter/material.dart';

import 'fluid_grid_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeHelper.instance.setWidth(MediaQuery.of(context).size);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(FluidSizes.m),
          child: ListView(
            children: <Widget>[
              Text(
                'This is a FluidUI headline large of size: ${FluidUITheme.textTheme.headlineLarge?.fontSize?.toStringAsFixed(1)}',
                style: FluidUITheme.textTheme.headlineLarge,
              ),
              Text(
                'This is a FluidUI headline medium of size: ${FluidUITheme.textTheme.headlineMedium?.fontSize?.toStringAsFixed(1)}',
                style: FluidUITheme.textTheme.headlineMedium,
              ),
              Text(
                'This is a FluidUI headline small of size: ${FluidUITheme.textTheme.headlineSmall?.fontSize?.toStringAsFixed(1)}',
                style: FluidUITheme.textTheme.headlineSmall,
              ),
              Text(
                'This is a FluidUI body large of size: ${FluidUITheme.textTheme.bodyLarge?.fontSize?.toStringAsFixed(1)}',
                style: FluidUITheme.textTheme.bodyLarge,
              ),
              Text(
                'This is a FluidUI body medium of size: ${FluidUITheme.textTheme.bodyMedium?.fontSize?.toStringAsFixed(1)}',
                style: FluidUITheme.textTheme.bodyMedium,
              ),
              Text(
                'This is a FluidUI body small of size: ${FluidUITheme.textTheme.bodySmall?.fontSize?.toStringAsFixed(1)}',
                style: FluidUITheme.textTheme.bodySmall,
              ),
              SizedBox(height: FluidSizes.m),
              Text(
                'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.',
                style: FluidUITheme.textTheme.bodySmall,
              ),
              Text('Padding: ${FluidSizes.m.toString()}'),
              SizedBox(height: FluidSizes.m),
              FluidGridWidget(
                width: MediaQuery.of(context).size.width,
                minimalChildWidth: 200,
                bottomSpacing: FluidSizes.m,
                itemSpacing: FluidSizes.m,
                children: List.generate(
                  6,
                  (index) => Image.network(
                    'https://images.ctfassets.net/4pxjo1vaz7xk/MTY3Mjc1MTE0MDYwOTM/f7060314cecad70c362e8ac5c1698552/hero-hand-bloomer2-app-home-texture-bubble-wrap-mobile-nl.jpg',
                  ),
                ),
              ),
              FluidGridWidget(
                width: MediaQuery.of(context).size.width,
                minimalChildWidth: 200,
                bottomSpacing: FluidSizes.m,
                itemSpacing: FluidSizes.m,
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
