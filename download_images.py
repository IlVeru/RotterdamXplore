import os
import urllib.request

images = {
    'museum.jpg': 'https://images.unsplash.com/photo-1544256718-3b61027142be?q=80&w=600&auto=format&fit=crop',
    'prison.jpg': 'https://images.unsplash.com/photo-1582559937965-06ab58b5cc04?q=80&w=600&auto=format&fit=crop',
    'bastion.jpg': 'https://images.unsplash.com/photo-1596404768393-21b920bf04f8?q=80&w=600&auto=format&fit=crop',
    'garden.jpg': 'https://images.unsplash.com/photo-1588698188176-79ba0a56f6cb?q=80&w=600&auto=format&fit=crop',
    'bastion_mandarsyah.jpg': 'https://images.unsplash.com/photo-1533423719013-1b9134a4c281?q=80&w=600&auto=format&fit=crop',
    'church.jpg': 'https://images.unsplash.com/photo-1582559937965-06ab58b5cc04?q=80&w=600&auto=format&fit=crop',
    'art_center.jpg': 'https://images.unsplash.com/photo-1566373801999-73f1d22736b4?q=80&w=600&auto=format&fit=crop',
    'library.jpg': 'https://images.unsplash.com/photo-1558231362-f7fb5625ecde?q=80&w=600&auto=format&fit=crop'
}

os.makedirs('assets/images', exist_ok=True)

headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'}

for name, url in images.items():
    path = os.path.join('assets/images', name)
    print(f"Downloading {name}...")
    try:
        req = urllib.request.Request(url, headers=headers)
        with urllib.request.urlopen(req) as response, open(path, 'wb') as out_file:
            out_file.write(response.read())
        print(f"Successfully downloaded to {path}")
    except Exception as e:
        print(f"Failed to download {name}: {e}")
