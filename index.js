// This file exists to satisfy the Render deployment
// The actual application is served as static files via the 'serve' package
const http = require('http');

console.log('Starting static file server via serve package');

// Create a very simple server that outputs some information
// This is just a fallback in case the serve command fails
http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Server is running. Please access the static files directly.\n');
}).listen(process.env.PORT || 3000);

// Execute the serve command
const { execSync } = require('child_process');
try {
  execSync('npx serve', { stdio: 'inherit' });
} catch (error) {
  console.error('Failed to start serve:', error);
}
