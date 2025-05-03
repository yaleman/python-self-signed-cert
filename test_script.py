import requests
import urllib3

print("#" * 50)
print("Testing unverified")
print("#" * 50)
try:
    # This will fail with self-signed cert
    urllib3.disable_warnings()
    response = requests.get("https://localhost:8443", verify=False)
    print(f"Succeeded with SSL verification disabled! Status: {response.status_code}")
    # Suppress the InsecureRequestWarning that comes with verify=False
except Exception as e:
    print(f"Failed without verification: {e}")


print("#" * 50)
print("Testing with verify...")
print("#" * 50)
try:
    # Point directly to your self-signed certificate
    response = requests.get("https://localhost:8443", verify="cert.pem")
    print(f"Succeeded with verify! Status: {response.status_code}")
except Exception as e:
    print(f"Failed with verify: {e}")
