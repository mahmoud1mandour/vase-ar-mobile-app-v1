import { cpSync, existsSync } from 'node:fs';

// The app references images with plain strings like './assets/house.jpg', which Vite can't see,
// so copy the whole assets folder into dist/ after every build (this is what ends up inside the APK).
export default {
  base: './',
  plugins: [{
    name: 'copy-assets',
    closeBundle() { if (existsSync('assets')) cpSync('assets', 'dist/assets', { recursive: true }); }
  }]
};
