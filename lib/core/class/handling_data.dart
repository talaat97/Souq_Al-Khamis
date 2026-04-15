import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'status_request.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final VoidCallback? onRetry;

  const HandlingDataView({
    super.key,
    required this.statusRequest,
    required this.widget,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    switch (statusRequest) {
      case StatusRequest.loading:
        return const _ShimmerLoading();
      case StatusRequest.offlinefailure:
        return _StateView(
          icon: Icons.wifi_off_rounded,
          iconColor: Colors.orange,
          title: 'no_internet'.tr,
          subtitle: 'check_connection'.tr,
          onRetry: onRetry,
        );
      case StatusRequest.serverfailure:
        return _StateView(
          icon: Icons.cloud_off_rounded,
          iconColor: Colors.red,
          title: 'server_error'.tr,
          subtitle: 'try_again_later'.tr,
          onRetry: onRetry,
        );
      case StatusRequest.failure:
        return _StateView(
          icon: Icons.inbox_rounded,
          iconColor: Colors.grey,
          title: 'no_data'.tr,
          subtitle: 'no_data_subtitle'.tr,
          onRetry: onRetry,
        );
      default:
        return widget;
    }
  }
}

// ─── Shimmer Loading ──────────────────────────────────────────────────────────

class _ShimmerLoading extends StatefulWidget {
  const _ShimmerLoading();

  @override
  State<_ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<_ShimmerLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
    _animation = Tween<double>(begin: -1.5, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // Make the shimmer list non-scrolling and allow it to size itself when
      // used inside another scrollable (prevents unbounded height errors).
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, __) => AnimatedBuilder(
        animation: _animation,
        builder: (context, child) => _ShimmerCard(progress: _animation.value),
      ),
    );
  }
}

class _ShimmerCard extends StatelessWidget {
  final double progress;
  const _ShimmerCard({required this.progress});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = isDark ? Colors.grey.shade800 : Colors.grey.shade200;
    final highlightColor = isDark ? Colors.grey.shade600 : Colors.grey.shade100;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _ShimmerBox(
                width: 48,
                height: 48,
                radius: 12,
                progress: progress,
                base: baseColor,
                highlight: highlightColor,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ShimmerBox(
                      width: double.infinity,
                      height: 14,
                      radius: 8,
                      progress: progress,
                      base: baseColor,
                      highlight: highlightColor,
                    ),
                    const SizedBox(height: 8),
                    _ShimmerBox(
                      width: 120,
                      height: 12,
                      radius: 8,
                      progress: progress,
                      base: baseColor,
                      highlight: highlightColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _ShimmerBox(
            width: double.infinity,
            height: 12,
            radius: 8,
            progress: progress,
            base: baseColor,
            highlight: highlightColor,
          ),
          const SizedBox(height: 8),
          _ShimmerBox(
            width: 200,
            height: 12,
            radius: 8,
            progress: progress,
            base: baseColor,
            highlight: highlightColor,
          ),
        ],
      ),
    );
  }
}

class _ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final double progress;
  final Color base;
  final Color highlight;

  const _ShimmerBox({
    required this.width,
    required this.height,
    required this.radius,
    required this.progress,
    required this.base,
    required this.highlight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [0.0, 0.5, 1.0],
          colors: [base, highlight, base],
          transform: _SlideGradient(progress),
        ),
      ),
    );
  }
}

class _SlideGradient extends GradientTransform {
  final double progress;
  const _SlideGradient(this.progress);

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * progress, 0, 0);
  }
}

// ─── State View (Empty / Error / Offline) ────────────────────────────────────

class _StateView extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback? onRetry;

  const _StateView({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 56, color: iconColor),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh_rounded),
                label: Text('retry'.tr),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
