import requests

print("#"*50)
print("Testing unverified")
print("#"*50)
try:
    response = requests.get("https://localhost:8443")
except Exception as e:
    print(f"Failed to do it unconfigured: {e}")


print("#"*50)
print("Testing with verify...")
print("#"*50)
try:
    response = requests.get("https://localhost:8443", verify="cert.pem")
    print("Succeeded with verify!")
except Exception as e:
    print(f"Failed to do it with verify: {e}")
