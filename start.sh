
#!/bin/bash
# This script ensures the frontend app is properly deployed

# Create a symbolic link for index.js to satisfy render's expectations
if [ ! -f index.js ]; then
  echo "console.log('Server is running static files via serve');" > index.js
fi

# Make sure we have the serve.json configuration
if [ ! -f serve.json ]; then
  cat > serve.json << 'EOF'
{
  "public": ".",
  "rewrites": [
    { "source": "**", "destination": "/index.html" }
  ],
  "headers": [
    {
      "source": "**",
      "headers": [
        { "key": "Access-Control-Allow-Origin", "value": "*" },
        { "key": "X-Content-Type-Options", "value": "nosniff" }
      ]
    }
  ]
}
EOF
fi

# Start the server
npx serve
