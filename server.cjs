// --- existing imports above (none) ---
const express = require('express');
const path = require('path');
const app = express();

// Add the required headers for SAB + AudioWorklet "fast path"
app.use((req, res, next) => {
  res.setHeader('Cross-Origin-Opener-Policy', 'same-origin');
  res.setHeader('Cross-Origin-Embedder-Policy', 'require-corp');
  res.setHeader('Cross-Origin-Resource-Policy', 'same-origin');
  next();
});

// Serve the current folder (where index.html lives)
app.use(express.static(path.join(__dirname)));

app.listen(8080, () => {
  console.log('Local server on http://localhost:8080');
});
// --- nothing else below ---
