---
name: web-asset-generator
description: Generate web assets including favicons, app icons (PWA), and social media meta images (Open Graph) for Facebook, Twitter, WhatsApp, and LinkedIn. Use when users need icons, favicons, social sharing images, or Open Graph images from logos or text slogans. Handles image resizing, text-to-image generation, and provides proper HTML meta tags.
---

# Web Asset Generator

Generate professional web assets from logos or text slogans, including favicons, app icons, and social media meta images.

## Quick Start

When a user requests web assets:

1. **Clarify needs** if not specified:
   - What type of assets (favicons, app icons, social images, or everything)
   - Whether they have source material (logo image vs text/slogan)
   - For text-based images: color preferences

2. **Check for source material**:
   - If user uploaded an image: use it as the source
   - If user provides text/slogan: generate text-based images

3. **Generate the assets** using Python scripts if available, or describe the requirements clearly

4. **Provide HTML tags** for the generated assets

## Asset Types

### Favicons & App Icons
- `favicon-16x16.png`, `favicon-32x32.png`, `favicon-96x96.png`
- `favicon.ico` (multi-resolution)
- `apple-touch-icon.png` (180x180)
- `android-chrome-192x192.png`, `android-chrome-512x512.png`

### Social Media (Open Graph) Images
- `og-image.png` (1200x630 - Facebook, WhatsApp, LinkedIn)
- `twitter-image.png` (1200x675 - Twitter)
- `og-square.png` (1200x1200 - Square variant)

## HTML Tags

After generating, provide these tags for the user's `<head>`:

```html
<!-- Favicons -->
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">

<!-- Open Graph -->
<meta property="og:image" content="/og-image.png">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">

<!-- Twitter -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:image" content="/twitter-image.png">
```

## Platform Specifications

| Platform | Recommended Size | Max File Size |
|----------|-----------------|---------------|
| Facebook/LinkedIn | 1200x630 | 8MB |
| Twitter | 1200x675 | 5MB |
| Favicons | 16x16, 32x32, 96x96 | <100KB |
| Apple Touch Icon | 180x180 | <500KB |
| PWA Icons | 192x192, 512x512 | <500KB |

## Dependencies

- Python 3.6+
- Pillow: `pip install Pillow`
- Pilmoji (for emoji): `pip install pilmoji`

## Testing Your Meta Tags

- Facebook: https://developers.facebook.com/tools/debug/
- Twitter: https://cards-dev.twitter.com/validator
- LinkedIn: https://www.linkedin.com/post-inspector/
- Generic: https://www.opengraph.xyz/

## Notes

- OG images must be accessible via HTTPS URLs (not localhost)
- URLs in meta tags should be absolute
- Test after deploying to production/staging
