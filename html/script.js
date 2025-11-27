let isPhoneOpen = false;
let activeApp = null;

window.addEventListener('message', (event) => {
    const data = event.data;
    if (data.action === 'togglePhone') {
        togglePhoneUI(data.state);
    } else if (data.action === 'incomingCall') {
        showIncomingCall(data.phoneNumber);
    } else if (data.action === 'callEnded') {
        hideIncomingCall();
    }
});

function togglePhoneUI(state) {
    const phone = document.getElementById('phone');
    phone.style.display = state ? 'flex' : 'none';
    isPhoneOpen = state;
}

document.querySelectorAll('.app').forEach(app => {
    app.addEventListener('click', () => {
        openApp(app.dataset.app);
    });
});

function openApp(appName) {
    const content = document.getElementById('app-content');
    activeApp = appName;
    content.innerHTML = `<h2>${appName}</h2><p>Hier wird die App geladen...</p>`;
}

document.getElementById('close-btn').addEventListener('click', () => {
    fetch(`https://${GetParentResourceName()}/closePhone`, { method: 'POST' });
});

function showIncomingCall(number) {
    const callDiv = document.getElementById('incoming-call');
    document.getElementById('caller-name').innerText = `Anruf von: ${number}`;
    callDiv.style.display = 'flex';
}

function hideIncomingCall() {
    const callDiv = document.getElementById('incoming-call');
    callDiv.style.display = 'none';
}

document.getElementById('accept-call').addEventListener('click', () => {
    fetch(`https://${GetParentResourceName()}/acceptCall`, { method: 'POST' });
    hideIncomingCall();
});

document.getElementById('end-call').addEventListener('click', () => {
    fetch(`https://${GetParentResourceName()}/endCall`, { method: 'POST' });
    hideIncomingCall();
});
