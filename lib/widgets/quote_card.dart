import 'dart:math';
import 'package:flutter/material.dart';
import '../models/quote.dart';

class QuoteCard extends StatefulWidget {
  final Quote quote;
  final String languageCode; // Will default to English until Phase 5

  const QuoteCard({
    super.key,
    required this.quote,
    this.languageCode = 'en',
  });

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(QuoteCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the user clicks 'Next' and the quote changes, reset the card to the front instantly
    if (oldWidget.quote.id != widget.quote.id) {
      _isFront = true;
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isFront = !_isFront;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final angle = _animation.value * pi;
          // If angle is past 90 degrees (pi/2), we render the back of the card
          final isUnder = angle > pi / 2;

          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Adds 3D perspective depth
              ..rotateY(angle),
            alignment: Alignment.center,
            child: isUnder
                ? Transform(
                    // Mirror the back side so the text isn't backwards
                    transform: Matrix4.identity()..rotateY(pi),
                    alignment: Alignment.center,
                    child: _buildBack(context),
                  )
                : _buildFront(context),
          );
        },
      ),
    );
  }

  Widget _buildFront(BuildContext context) {
    return _buildCardBase(
      context: context,
      color: const Color(0xFF2E7D32), // Brand Green
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('🌱', style: TextStyle(fontSize: 48)),
          const SizedBox(height: 16),
          const Text(
            'Positive Mindset',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(40),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Tap to reveal',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBack(BuildContext context) {
    final text = widget.quote.getText(widget.languageCode);
    return _buildCardBase(
      context: context,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.format_quote_rounded, size: 48, color: Color(0xFF81C784)),
            const SizedBox(height: 24),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                color: Color(0xFF1E293B),
                height: 1.4,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              widget.quote.isBibleVerse
                  ? widget.quote.bibleReference ?? ''
                  : '— ${widget.quote.author}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardBase({required BuildContext context, required Color color, required Widget child}) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 450, maxHeight: 600),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200, width: color == Colors.white ? 1 : 0),
      ),
      child: child,
    );
  }
}