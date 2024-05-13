import 'package:flutter/material.dart';
import 'package:foody/domain/controllers/controllersCarruselRecent.dart';
import 'package:foody/domain/models/recent.dart';
import 'package:foody/ui/pages/user/recent/carrusel/recent.dart';

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
        child: Row(
          // Use Row instead of SizedBox for separation
          children: [
            Expanded(
              // Wrap GridView with Expanded for full width
              child: Scrollbar(
                // Muestra la barra de desplazamiento siempre
                thickness: 10.0,
                radius: const Radius.circular(5.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 4 / 3,
                    crossAxisSpacing: 10.0,
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
            const SizedBox(
              width: 5.0,
              height: 10.0,
            ), // Add spacing between GridView and scrollbar
          ],
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
        height: 200,
        width: double.infinity,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecentPage(recent: widget.recent),
              ),
            );
          },
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 5,
                      ),
                      child: AspectRatio(
                        aspectRatio: 250 / 200,
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 1.0,
                            right: 5.0,
                            left: 5.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(0, 0, 0, 0)
                                    .withOpacity(0.25),
                                spreadRadius: -5.0,
                                blurRadius: 4.0,
                                offset: const Offset(-1.0, 8.0),
                              ),
                            ],
                          ),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: widget.recent.image,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                widget.recent.description,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(30, 30, 30, 50),
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              _isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
