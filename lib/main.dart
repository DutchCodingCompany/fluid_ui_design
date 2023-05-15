import 'package:fluid_ui_design/fluid_size.dart';
import 'package:fluid_ui_design/screen_size_helper.dart';
import 'package:fluid_ui_design/text_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    ScreenSizeHelper.instance.setWidth(MediaQuery.of(context).size);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
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
              Wrap(
                spacing: FluidSizes.m,
                runSpacing: FluidSizes.m,
                children: [
                  SizedBox(
                    width: const FluidSize(min: 100, max: 400).width,
                    height: 50,
                    child: Container(color: Colors.red),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 100, minHeight: 50, maxWidth: 200),
                    child: Container(color: Colors.red),
                  ),
                  Container(
                    width: const FluidSize(min: 50, max: 200).width,
                    height: 50,
                    color: Colors.blue,
                    child: const Center(child: Text('Fluid')),
                  ),
                ],
              ),
              SizedBox(height: FluidSizes.m),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      height: 50,
                    ),
                  ),
                  SizedBox(width: FluidSizes.l),
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      height: 50,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
