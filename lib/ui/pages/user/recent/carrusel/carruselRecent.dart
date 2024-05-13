import 'package:flutter/material.dart';
import 'package:foody/domain/controllers/controllersCarruselRecent.dart';
import 'package:foody/domain/models/recent.dart';

class RecentCarousel extends StatelessWidget {
  final RecentController _recentController = RecentController();

  @override
  Widget build(BuildContext context) {
    final scrollbarColor = Theme.of(context).scrollbarTheme.thumbColor;

    return Theme(
      data: Theme.of(context).copyWith(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: scrollbarColor,
        ),
      ),
      child: SizedBox(
        height: 210.0,
        child: Scrollbar(
          // Muestra la barra de desplazamiento siempre
          thickness: 15.0,
          radius: const Radius.circular(5.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 4/3,
              //crossAxisSpacing: 10.0,


            ),
            itemCount: _recentController.listRecent.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              // Ensure listRecipes is a List<Recent>
              if (_recentController.listRecent is List<Recent>) {
                final Recent recent = _recentController.listRecent[index];
                return RecentButton(
                  recent: recent,
                  recentController: _recentController,
                );
              } else {
                // Handle the case if listRecipes is not List<Recent>
                return const SizedBox(); // Or handle differently
              }
            }, 
          ),
        ),
      ),
    );
  }
}

class RecentButton extends StatefulWidget {
  final Recent recent;
  final RecentController recentController;

  const RecentButton({
    Key? key,
    required this.recent,
    required this.recentController,
  }) : super(key: key);

  @override
  _RecentButtonState createState() => _RecentButtonState();
}

class _RecentButtonState extends State<RecentButton> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 205,
        width: double.infinity,
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Stack(
            children: [
              Column(
                // Remove Flexible widgets and set mainAxisSize to min
                
                mainAxisSize: MainAxisSize.min,
                children: [
                    Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 5,
                    ),
                    child: AspectRatio(
                      aspectRatio: 500 / 300,
                      child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: widget.recent.image,
                      ),
                      ),
                    ),
                    ),
                  Expanded(
                    // Wrap the title in an Expanded widget
                    child: SizedBox(
                        width: double.infinity, // Take maximum available width
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Text(
                            widget.recent.description,
                            style: const TextStyle(fontSize: 16.0,
                          
                          fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                  ),
                 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          _isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: _isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isFavorite = !_isFavorite;
                            if (_isFavorite) {
                              widget.recentController.listRecent
                                  .add(widget.recent);
                            } else {
                              widget.recentController.listRecent
                                  .remove(widget.recent);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
