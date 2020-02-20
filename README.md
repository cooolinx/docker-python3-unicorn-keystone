# docker-python3-unicorn-keystone

Repository containing Python 3.7+, [Unicorn Engine](https://github.com/unicorn-engine/unicorn) 1.0.2rc2 (CPU emulator framework), [Keystone Engine](https://github.com/keystone-engine/keystone) 0.9.1-3 (Assembler framework, with [Pypi bug fixed](https://github.com/keystone-engine/keystone/issues/386)), based on alpine https://hub.docker.com/r/cooolin/

## Build

[Docker](https://docs.docker.com) install is required.

You can build it on your own, note it takes lots of time, be prepared.

```bash
git clone <git-repository>
cd python3-unicorn-keystone
docker image build -t cooolin/python3-unicorn-keystone .
docker push cooolin/python3-unicorn-keystone  # Change the name `coolin` as your account name on hub.docker.com
```

Another option is just using the built image from DockerHub which is significantly faster, it basically download the already build image.
```
docker pull cooolin/python3-unicorn-keystone
```

## Usage

Image has Python 3.7.x, Unicorn Engine 1.0.2rc2, Keystone Engine 0.9.1-3. Example:

```bash
docker run --rm -it cooolin/python3-unicorn-keystone sh

python

>>> Ks(KS_ARCH_X86, KS_MODE_32).asm(b'INC ecx;')
([65], 2)
```

See [Tutorial for Unicorn](https://www.unicorn-engine.org/docs/tutorial.html) and [Tutorial for Keystone](http://www.keystone-engine.org/docs/tutorial.html) for further details.
