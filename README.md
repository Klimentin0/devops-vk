# Профильное задание VK devops.
>Мешков Климентий
---

- [Установка и запуск](#установка-и-запуск)
- [Работа с кластером](#работа-с-кластером)

## Установка и запуск
### Важные предустановки
- Используется Kind для локального кластера.

- Должен быть установлен HELM (https://helm.sh)

- Порты 80 и 443 должны быть свободны. (например apache2 80 занимает обычно)

### Установка
Если распаковывать из архива, то оба архива идентичны:

- Если tar.gz:
```
tar -xvf devops-vk.tar.gz
```
- Если zip:
```
unzip devops-vk.zip
```
Также можно с репоизтория: 
```
git clone 
```
И переходим в корневую папку проекта после извлечения(или клонирования):
```
cd devops-vk
```
Делаем исполняемым скрипт для установки:
```
chmod +x deploy.sh
```
И запускаем проект:
```
./deploy.sh
```
## Работа с кластером
Прокидываем порт к контроллеру Ingress:
```
kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 8080:80
```
Далее окно с прокинутым портом не закрываем и работаем в новом.


В новом окне(вкладке) терминала

Проверяем доступность контента:
```
curl -H "Host: hello.local" http://localhost:8080
```

Проверяем статус подов:
```
kubectl get pods
```
Проверяем сервис:
```
kubectl get svc
```
Проверяем ingress:
```
kubectl get ingress
```
Смотрим логи контроллера ingress:
```
kubectl logs -n ingress-nginx -l app.kubernetes.io/name=ingress-nginx
```
Или с деталями о контроллере
```
kubectl logs -n ingress-nginx deployment/ingress-nginx-controller
```
Смотрим логи подов(вместо 'pod' подставляем ваш вариант названия который получили после команды kubectl get pods):
```
kubectl logs 'pod'
```
Детальный разбор компонентов кластера(вместо 'pod' подставляем ваш вариант названия который получили после команды kubectl get pods): 
```
kubectl describe pod 'pod'
kubectl describe ingress example-ingress
```
Проверяем смонтировался ли configmap(вместо 'pod' подставляем ваш вариант названия который получили после команды kubectl get pods):
```
kubectl exec 'pod' -- ls /usr/share/nginx/html
kubectl exec 'pod' -- cat /usr/share/nginx/html/index.html
```